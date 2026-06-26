"use client";
import { useState, useRef, useEffect } from "react";
import { Play, RotateCcw, Copy, Check, Terminal, Code2, Database, Globe, BookOpen, ChevronRight, ChevronDown, CheckCircle, Circle, AlertCircle, Loader2 } from "lucide-react";

// ─────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────
type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

type Props = {
  labs: Lab[];
  accentColor?: string;
  techName?: string;
};

// ─────────────────────────────────────────────────────────
// Terminal / Code Runner component
// ─────────────────────────────────────────────────────────
function InteractiveConsole({
  type,
  initialCode = "",
  language = "bash",
  accentColor = "#3B82F6",
}: {
  type: "terminal" | "code" | "sql";
  initialCode?: string;
  language?: string;
  accentColor?: string;
}) {
  const [code, setCode] = useState(initialCode);
  const [output, setOutput] = useState<string[]>([]);
  const [running, setRunning] = useState(false);
  const [copied, setCopied] = useState(false);
  const textRef = useRef<HTMLTextAreaElement>(null);
  const outputRef = useRef<HTMLDivElement>(null);

  // Simulated execution (safe, educational)
  const simulate = (cmd: string): string => {
    const line = cmd.trim();
    if (!line || line.startsWith("#")) return "";

    // Bash simulations
    if (type === "terminal" || language === "bash") {
      if (line === "pwd") return "/home/user";
      if (line === "whoami") return "user";
      if (line.startsWith("echo ")) return line.slice(5).replace(/['"]/g, "");
      if (line === "date") return new Date().toString();
      if (line === "ls" || line === "ls -la") return "total 24\ndrwxr-xr-x  5 user user 4096 Jan 15 10:30 .\ndrwxr-xr-x 12 user user 4096 Jan 15 10:00 ..\n-rw-r--r--  1 user user  220 Jan 15 10:00 .bashrc\ndrwxr-xr-x  2 user user 4096 Jan 15 10:30 projects";
      if (line.startsWith("mkdir ")) return `Directory '${line.slice(6)}' created`;
      if (line.startsWith("cd ")) return `Changed to: ${line.slice(3)}`;
      if (line === "uname -a") return "Linux synfracore 5.15.0 #1 SMP x86_64 GNU/Linux";
      if (line === "df -h") return "Filesystem      Size  Used Avail Use% Mounted on\n/dev/sda1        50G   12G   35G  26% /\ntmpfs           1.9G     0  1.9G   0% /dev/shm";
      if (line === "free -h") return "               total        used        free\nMem:            3.8Gi       1.2Gi       2.1Gi\nSwap:           2.0Gi          0B       2.0Gi";
      if (line.startsWith("cat ")) return `[Contents of ${line.slice(4)}]`;
      if (line.startsWith("docker ")) {
        if (line.includes("ps")) return "CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES";
        if (line.includes("images")) return "REPOSITORY   TAG       IMAGE ID       CREATED        SIZE\nnginx        latest    605c77e624dd   2 days ago     141MB";
        if (line.includes("run")) return `Container started: ${Math.random().toString(36).slice(2, 12)}`;
        if (line.includes("pull")) return `Pulling image...\nStatus: Image pulled successfully`;
        return "[Docker command executed]";
      }
      if (line.startsWith("kubectl ")) {
        if (line.includes("get pods")) return "NAME                     READY   STATUS    RESTARTS   AGE\nweb-app-7d4b9c5f8-x2k9p  1/1     Running   0          5m\nweb-app-7d4b9c5f8-n8t4r  1/1     Running   0          5m";
        if (line.includes("get nodes")) return "NAME        STATUS   ROLES           AGE   VERSION\nnode-1      Ready    control-plane   10d   v1.28.0\nnode-2      Ready    <none>          10d   v1.28.0";
        if (line.includes("apply")) return "deployment.apps/web-app configured\nservice/web-app-svc created";
        return "[kubectl command executed]";
      }
      if (line.startsWith("git ")) {
        if (line === "git status") return "On branch main\nnothing to commit, working tree clean";
        if (line.startsWith("git log")) return "commit a1b2c3d4 (HEAD -> main)\nAuthor: You <you@example.com>\nDate:   Wed Jan 15 10:00:00 2024\n\n    Initial commit";
        return "[git command executed]";
      }
      if (line.startsWith("terraform ")) {
        if (line.includes("init")) return "Initializing...\nTerraform has been successfully initialized!";
        if (line.includes("plan")) return "Plan: 3 to add, 0 to change, 0 to destroy.";
        if (line.includes("apply")) return "Apply complete! Resources: 3 added, 0 changed, 0 destroyed.";
        return "[terraform command executed]";
      }
      if (line.startsWith("ansible ")) return "[ansible command executed]\nPlay recap: localhost ok=2 changed=1";
      if (line.startsWith("helm ")) {
        if (line.includes("install")) return "NAME: my-release\nLAST DEPLOYED: Wed Jan 15\nSTATUS: deployed\nREVISION: 1";
        return "[helm command executed]";
      }
      if (line.startsWith("python") || line.startsWith("python3")) return "[Python interpreter] Use the Code Editor tab for Python";
      return `[Running: ${line}]\n✓ Command executed successfully`;
    }

    // SQL simulations
    if (type === "sql") {
      const upper = line.toUpperCase();
      if (upper.startsWith("SELECT 1")) return "┌───┐\n│ 1 │\n└───┘\n(1 row)";
      if (upper.includes("SELECT") && upper.includes("FROM")) {
        if (upper.includes("USERS")) return "┌────┬─────────┬──────────────────────┐\n│ id │ name    │ email                │\n├────┼─────────┼──────────────────────┤\n│  1 │ Alice   │ alice@example.com    │\n│  2 │ Bob     │ bob@example.com      │\n│  3 │ Charlie │ charlie@example.com  │\n└────┴─────────┴──────────────────────┘\n(3 rows)";
        if (upper.includes("PRODUCTS")) return "┌────┬──────────────┬────────┐\n│ id │ name         │  price │\n├────┼──────────────┼────────┤\n│  1 │ Widget Pro   │  49.99 │\n│  2 │ Gadget Plus  │  29.99 │\n└────┴──────────────┴────────┘\n(2 rows)";
        return "┌──────────────────┐\n│ (query result)   │\n└──────────────────┘\n(0 rows)";
      }
      if (upper.startsWith("CREATE TABLE")) return "CREATE TABLE";
      if (upper.startsWith("INSERT")) return "INSERT 0 1";
      if (upper.startsWith("UPDATE")) return "UPDATE 1";
      if (upper.startsWith("DELETE")) return "DELETE 1";
      if (upper.startsWith("DROP")) return "DROP TABLE";
      if (upper.startsWith("\\DT") || upper.startsWith("SHOW TABLES")) return "users\nproducts\norders\norder_items";
      return "-- Query executed successfully";
    }

    // Python
    if (language === "python") {
      if (line.startsWith("print(")) {
        const match = line.match(/print\((.+)\)/);
        if (match) {
          try {
            const val = match[1].replace(/['"]/g, "");
            return val;
          } catch { return "[output]"; }
        }
      }
      return "[Python output]";
    }

    return `[Executed: ${line}]`;
  };

  const run = () => {
    setRunning(true);
    const lines = code.split("\n").filter(l => l.trim());
    const newOutput: string[] = [];

    newOutput.push(`$ Running at ${new Date().toLocaleTimeString()}`);
    newOutput.push("─".repeat(40));

    lines.forEach(line => {
      if (line.trim().startsWith("#") || line.trim().startsWith("--")) {
        newOutput.push(`\x1b[90m${line}\x1b[0m`);
      } else if (line.trim()) {
        if (type === "terminal") newOutput.push(`\x1b[32m$\x1b[0m ${line}`);
        else if (type === "sql") newOutput.push(`\x1b[36m>\x1b[0m ${line}`);
        const result = simulate(line);
        if (result) newOutput.push(result);
      }
    });

    newOutput.push("─".repeat(40));
    newOutput.push("✓ Execution complete");

    setTimeout(() => {
      setOutput(prev => [...prev, ...newOutput, ""]);
      setRunning(false);
      setTimeout(() => {
        if (outputRef.current) outputRef.current.scrollTop = outputRef.current.scrollHeight;
      }, 50);
    }, 400 + Math.random() * 300);
  };

  const clear = () => setOutput([]);

  const copy = () => {
    navigator.clipboard.writeText(code);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const iconMap = { terminal: <Terminal size={14}/>, code: <Code2 size={14}/>, sql: <Database size={14}/> };
  const labelMap = { terminal: "Terminal", code: "Code Editor", sql: "SQL Console" };

  return (
    <div style={{ border: `1px solid ${accentColor}33`, borderRadius: "12px", overflow: "hidden", margin: "16px 0", background: "#0D1117" }}>
      {/* Header */}
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "10px 16px", background: "#161B22", borderBottom: `1px solid ${accentColor}33` }}>
        <div style={{ display: "flex", alignItems: "center", gap: "8px", color: accentColor, fontSize: "13px", fontWeight: 600 }}>
          {iconMap[type]}
          {labelMap[type]}
          <span style={{ color: "#444", fontSize: "11px" }}>— Simulated (safe)</span>
        </div>
        <div style={{ display: "flex", gap: "6px" }}>
          <button onClick={copy} style={{ background: "none", border: `1px solid #333`, color: "#aaa", padding: "4px 10px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", display: "flex", alignItems: "center", gap: "4px" }}>
            {copied ? <><Check size={11}/> Copied</> : <><Copy size={11}/> Copy</>}
          </button>
          <button onClick={clear} style={{ background: "none", border: `1px solid #333`, color: "#aaa", padding: "4px 10px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", display: "flex", alignItems: "center", gap: "4px" }}>
            <RotateCcw size={11}/> Clear
          </button>
          <button onClick={run} disabled={running} style={{ background: accentColor, border: "none", color: "#fff", padding: "4px 14px", borderRadius: "6px", cursor: running ? "wait" : "pointer", fontSize: "12px", fontWeight: 600, display: "flex", alignItems: "center", gap: "5px", opacity: running ? 0.7 : 1 }}>
            {running ? <><Loader2 size={11} className="spin"/> Running...</> : <><Play size={11}/> Run</>}
          </button>
        </div>
      </div>

      {/* Editor + Output split */}
      <div style={{ display: "flex", height: "280px" }}>
        <div style={{ flex: 1, borderRight: "1px solid #21262D" }}>
          <textarea
            ref={textRef}
            value={code}
            onChange={e => setCode(e.target.value)}
            spellCheck={false}
            placeholder={type === "sql" ? "-- Write SQL here\nSELECT * FROM users LIMIT 5;" : type === "terminal" ? "# Write commands here\necho 'Hello World'\nls -la" : "# Write code here\nprint('Hello World')"}
            style={{
              width: "100%", height: "100%", background: "transparent",
              border: "none", outline: "none", resize: "none",
              color: "#E6EDF3", fontFamily: "monospace", fontSize: "13px",
              lineHeight: 1.6, padding: "14px 16px", boxSizing: "border-box",
              tabSize: 2,
            }}
            onKeyDown={e => {
              if (e.key === "Tab") { e.preventDefault(); const s = e.currentTarget.selectionStart; const end = e.currentTarget.selectionEnd; setCode(code.substring(0,s) + "  " + code.substring(end)); setTimeout(() => { if(textRef.current) { textRef.current.selectionStart = textRef.current.selectionEnd = s + 2; } }, 0); }
              if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) run();
            }}
          />
        </div>
        <div ref={outputRef} style={{ width: "45%", overflow: "auto", padding: "14px 16px", fontFamily: "monospace", fontSize: "12px", lineHeight: 1.7, color: "#8B949E" }}>
          {output.length === 0 ? (
            <div style={{ color: "#444", fontStyle: "italic", marginTop: "80px", textAlign: "center" }}>
              Output appears here<br/>
              <span style={{ fontSize: "11px" }}>Ctrl+Enter to run</span>
            </div>
          ) : (
            output.map((line, i) => (
              <div key={i} style={{
                color: line.startsWith("✓") ? "#3FB950" : line.startsWith("─") ? "#30363D" : line.startsWith("$") || line.startsWith(">") ? "#79C0FF" : line.includes("error") || line.includes("Error") ? "#F85149" : "#E6EDF3",
                whiteSpace: "pre-wrap", wordBreak: "break-all"
              }}>{line}</div>
            ))
          )}
        </div>
      </div>
      <div style={{ padding: "6px 16px", background: "#161B22", borderTop: "1px solid #21262D", fontSize: "11px", color: "#484F58", display: "flex", justifyContent: "space-between" }}>
        <span>Ctrl+Enter to run • Tab for indent</span>
        <span>{code.split("\n").length} lines</span>
      </div>
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Difficulty badge
// ─────────────────────────────────────────────────────────
function DiffBadge({ level }: { level: string }) {
  const colors: Record<string, string> = { Beginner: "#10B981", Intermediate: "#F59E0B", Advanced: "#F43F5E" };
  const c = colors[level] || "#6B7280";
  return <span style={{ background: `${c}22`, color: c, border: `1px solid ${c}44`, padding: "2px 10px", borderRadius: "20px", fontSize: "11px", fontWeight: 700 }}>{level}</span>;
}

// ─────────────────────────────────────────────────────────
// Single Lab component
// ─────────────────────────────────────────────────────────
function LabCard({ lab, accentColor }: { lab: Lab; accentColor: string }) {
  const [open, setOpen] = useState(false);
  const [completedSteps, setCompletedSteps] = useState<Set<string>>(new Set());
  const [showHint, setShowHint] = useState<Set<string>>(new Set());

  const toggleStep = (id: string) => {
    setCompletedSteps(prev => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id); else next.add(id);
      return next;
    });
  };

  const progress = lab.steps.length > 0 ? Math.round((completedSteps.size / lab.steps.length) * 100) : 0;

  return (
    <div style={{ border: `1px solid var(--border)`, borderRadius: "14px", overflow: "hidden", marginBottom: "16px" }}>
      {/* Lab Header */}
      <div
        onClick={() => setOpen(o => !o)}
        style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "20px 24px", background: "var(--bg-1)", cursor: "pointer" }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: "16px" }}>
          <div style={{ width: "44px", height: "44px", borderRadius: "12px", background: `${accentColor}22`, border: `1px solid ${accentColor}33`, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
            <Terminal size={20} color={accentColor}/>
          </div>
          <div>
            <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "6px", flexWrap: "wrap" }}>
              <span style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px" }}>{lab.title}</span>
              <DiffBadge level={lab.difficulty}/>
              <span style={{ color: "var(--text-4)", fontSize: "12px" }}>⏱ {lab.duration}</span>
            </div>
            <p style={{ color: "var(--text-4)", fontSize: "13px", margin: 0 }}>{lab.objective}</p>
            <div style={{ display: "flex", gap: "6px", marginTop: "8px", flexWrap: "wrap" }}>
              {lab.tools.map(tool => (
                <span key={tool} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "1px 8px", borderRadius: "4px", fontSize: "11px", color: "var(--text-4)", fontFamily: "monospace" }}>{tool}</span>
              ))}
            </div>
          </div>
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: "16px", flexShrink: 0, marginLeft: "16px" }}>
          {completedSteps.size > 0 && (
            <div style={{ textAlign: "right" }}>
              <div style={{ fontSize: "11px", color: accentColor, fontWeight: 600, marginBottom: "4px" }}>{progress}% done</div>
              <div style={{ width: "80px", height: "4px", background: "var(--bg-2)", borderRadius: "2px" }}>
                <div style={{ width: `${progress}%`, height: "100%", background: accentColor, borderRadius: "2px", transition: "width 0.3s" }}/>
              </div>
            </div>
          )}
          {open ? <ChevronDown size={18} color="var(--text-4)"/> : <ChevronRight size={18} color="var(--text-4)"/>}
        </div>
      </div>

      {/* Lab Content */}
      {open && (
        <div style={{ padding: "24px", borderTop: "1px solid var(--border)" }}>
          {/* Steps */}
          {lab.steps.map((step, idx) => {
            const done = completedSteps.has(step.id);
            const hinted = showHint.has(step.id);
            return (
              <div key={step.id} style={{ marginBottom: "24px", paddingLeft: "40px", position: "relative" }}>
                {/* Step number / check */}
                <div
                  onClick={() => toggleStep(step.id)}
                  style={{
                    position: "absolute", left: 0, top: "2px",
                    width: "28px", height: "28px", borderRadius: "50%",
                    background: done ? accentColor : "var(--bg-2)",
                    border: `2px solid ${done ? accentColor : "var(--border)"}`,
                    display: "flex", alignItems: "center", justifyContent: "center",
                    cursor: "pointer", transition: "all 0.2s",
                    color: done ? "#fff" : "var(--text-4)", fontSize: "12px", fontWeight: 700,
                  }}
                >
                  {done ? <Check size={13}/> : idx + 1}
                </div>

                {/* Connector line */}
                {idx < lab.steps.length - 1 && (
                  <div style={{ position: "absolute", left: "13px", top: "30px", width: "2px", height: "calc(100% + 4px)", background: done ? `${accentColor}44` : "var(--border)" }}/>
                )}

                {/* Step content */}
                <div>
                  <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
                    <span style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "14px", textDecoration: done ? "line-through" : "none", color: done ? "var(--text-4)" : "inherit" }}>
                      {step.title}
                    </span>
                    {step.type === "verify" && <span style={{ background: "#3FB95022", color: "#3FB950", padding: "1px 8px", borderRadius: "4px", fontSize: "11px" }}>✓ Verify</span>}
                    {step.type === "challenge" && <span style={{ background: "#F5900022", color: "#F59000", padding: "1px 8px", borderRadius: "4px", fontSize: "11px" }}>⚡ Challenge</span>}
                  </div>

                  <p style={{ color: "var(--text-3)", fontSize: "14px", lineHeight: 1.7, marginBottom: "12px" }}>{step.description}</p>

                  {/* Code block */}
                  {step.code && (
                    <div style={{ marginBottom: "12px" }}>
                      <CopyableCode code={step.code} language={step.language || "bash"} accentColor={accentColor}/>
                    </div>
                  )}

                  {/* Expected output */}
                  {step.expectedOutput && (
                    <div style={{ background: "#0D1117", border: "1px solid #30363D", borderRadius: "8px", padding: "12px 16px", marginBottom: "12px", fontFamily: "monospace", fontSize: "12px", color: "#3FB950" }}>
                      <div style={{ color: "#484F58", fontSize: "11px", marginBottom: "6px" }}>Expected output:</div>
                      <pre style={{ margin: 0, whiteSpace: "pre-wrap" }}>{step.expectedOutput}</pre>
                    </div>
                  )}

                  {/* Hint */}
                  {step.hint && (
                    <div>
                      <button
                        onClick={() => setShowHint(prev => { const n = new Set(prev); if(n.has(step.id)) n.delete(step.id); else n.add(step.id); return n; })}
                        style={{ background: "none", border: `1px solid ${accentColor}44`, color: accentColor, padding: "4px 12px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", marginBottom: "8px" }}
                      >
                        {hinted ? "Hide hint" : "💡 Show hint"}
                      </button>
                      {hinted && (
                        <div style={{ background: "#F59E0B11", border: "1px solid #F59E0B33", borderRadius: "8px", padding: "12px 16px", fontSize: "13px", color: "var(--text-3)" }}>
                          💡 {step.hint}
                        </div>
                      )}
                    </div>
                  )}

                  {/* Explanation */}
                  {step.explanation && (
                    <div style={{ background: `${accentColor}0d`, border: `1px solid ${accentColor}22`, borderRadius: "8px", padding: "12px 16px", marginTop: "10px", fontSize: "13px", color: "var(--text-3)", lineHeight: 1.6 }}>
                      <strong style={{ color: accentColor }}>📖 Why: </strong>{step.explanation}
                    </div>
                  )}
                </div>
              </div>
            );
          })}

          {/* Interactive Console */}
          {lab.interface && lab.interface !== "none" && (
            <div style={{ marginTop: "24px", paddingTop: "24px", borderTop: "1px solid var(--border)" }}>
              <h4 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, marginBottom: "12px", display: "flex", alignItems: "center", gap: "8px" }}>
                <Terminal size={16} color={accentColor}/>
                Practice Environment
                <span style={{ background: "#3FB95022", color: "#3FB950", padding: "2px 8px", borderRadius: "4px", fontSize: "11px" }}>Safe Simulation</span>
              </h4>
              <InteractiveConsole
                type={lab.interface === "sql-console" ? "sql" : lab.interface === "code-editor" ? "code" : "terminal"}
                language={lab.interface === "code-editor" ? "python" : "bash"}
                initialCode={lab.steps.filter(s => s.code).map(s => s.code).join("\n")}
                accentColor={accentColor}
              />
            </div>
          )}

          {/* Completion */}
          {progress === 100 && (
            <div style={{ marginTop: "20px", background: "#3FB95022", border: "1px solid #3FB95044", borderRadius: "12px", padding: "16px 20px", display: "flex", alignItems: "center", gap: "12px" }}>
              <CheckCircle size={24} color="#3FB950"/>
              <div>
                <div style={{ fontWeight: 700, color: "#3FB950", marginBottom: "2px" }}>Lab Complete! 🎉</div>
                <div style={{ fontSize: "13px", color: "var(--text-3)" }}>All steps completed. You can try the next lab or review any step.</div>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Copyable code snippet (static)
// ─────────────────────────────────────────────────────────
function CopyableCode({ code, language, accentColor }: { code: string; language: string; accentColor: string }) {
  const [copied, setCopied] = useState(false);
  const copy = () => { navigator.clipboard.writeText(code); setCopied(true); setTimeout(() => setCopied(false), 2000); };
  return (
    <div style={{ position: "relative", borderRadius: "10px", overflow: "hidden", border: "1px solid #21262D", background: "#0D1117" }}>
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", padding: "6px 14px", background: "#161B22", borderBottom: "1px solid #21262D" }}>
        <span style={{ fontFamily: "monospace", fontSize: "11px", color: "#79C0FF", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.06em" }}>{language}</span>
        <button onClick={copy} style={{ background: "none", border: "none", color: "#484F58", cursor: "pointer", fontSize: "12px", display: "flex", alignItems: "center", gap: "4px", padding: "2px 6px" }}>
          {copied ? <><Check size={11} color="#3FB950"/> <span style={{ color: "#3FB950" }}>Copied</span></> : <><Copy size={11}/> Copy</>}
        </button>
      </div>
      <pre style={{ margin: 0, padding: "16px", overflowX: "auto" }}>
        <code style={{ color: "#E6EDF3", fontSize: "13px", fontFamily: "monospace", lineHeight: 1.7 }}>{code}</code>
      </pre>
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Main export
// ─────────────────────────────────────────────────────────
export default function LabEnvironment({ labs, accentColor = "#3B82F6", techName = "Technology" }: Props) {
  const [filter, setFilter] = useState<string>("All");
  const difficulties = ["All", "Beginner", "Intermediate", "Advanced"];
  const filtered = filter === "All" ? labs : labs.filter(l => l.difficulty === filter);
  const counts = difficulties.slice(1).map(d => ({ d, n: labs.filter(l => l.difficulty === d).length }));

  return (
    <div>
      {/* Header */}
      <div style={{ marginBottom: "28px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "12px", flexWrap: "wrap" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "22px", fontWeight: 800, margin: 0 }}>
            {techName} — Hands-on Labs
          </h2>
          <span style={{ background: `${accentColor}22`, color: accentColor, border: `1px solid ${accentColor}33`, padding: "3px 12px", borderRadius: "20px", fontSize: "12px", fontWeight: 700 }}>
            {labs.length} Labs
          </span>
        </div>
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "16px" }}>
          Real hands-on scenarios with an interactive practice environment. Click any lab to start, follow the steps, and mark each one complete.
        </p>

        {/* Stats row */}
        <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", marginBottom: "16px" }}>
          {counts.filter(c => c.n > 0).map(({ d, n }) => {
            const colors: Record<string, string> = { Beginner: "#10B981", Intermediate: "#F59E0B", Advanced: "#F43F5E" };
            return (
              <div key={d} style={{ display: "flex", alignItems: "center", gap: "6px", background: "var(--bg-1)", border: "1px solid var(--border)", padding: "6px 14px", borderRadius: "8px" }}>
                <span style={{ width: "8px", height: "8px", borderRadius: "50%", background: colors[d] }}/>
                <span style={{ fontSize: "13px" }}>{n} {d}</span>
              </div>
            );
          })}
        </div>

        {/* Filter */}
        <div style={{ display: "flex", gap: "6px", flexWrap: "wrap" }}>
          {difficulties.map(d => (
            <button key={d} onClick={() => setFilter(d)} style={{
              background: filter === d ? accentColor : "var(--bg-1)",
              color: filter === d ? "#fff" : "var(--text-4)",
              border: `1px solid ${filter === d ? accentColor : "var(--border)"}`,
              padding: "5px 14px", borderRadius: "8px", cursor: "pointer", fontSize: "13px", fontWeight: filter === d ? 700 : 400,
            }}>{d}</button>
          ))}
        </div>
      </div>

      {/* Lab cards */}
      {filtered.length === 0 ? (
        <div style={{ textAlign: "center", padding: "40px", color: "var(--text-4)" }}>No {filter} labs yet</div>
      ) : (
        filtered.map(lab => <LabCard key={lab.id} lab={lab} accentColor={accentColor}/>)
      )}
    </div>
  );
}
