# Networking Interview Q&A

**Q: TCP vs UDP?**
TCP: reliable, ordered, connection-oriented (3-way handshake), slower. UDP: unreliable, unordered, connectionless, faster. TCP for: HTTP, SSH, databases. UDP for: DNS, video streaming, gaming.

**Q: How does DNS resolution work?**
Browser → OS cache → Recursive resolver (ISP) → Root nameserver (knows .com TLD) → TLD nameserver → Authoritative nameserver → Returns IP.

**Q: What is a subnet and CIDR?**
Subnet: subdivision of IP network. CIDR: Classless Inter-Domain Routing notation. 10.0.0.0/24 = 256 addresses (10.0.0.0–10.0.0.255). /16 = 65,536 addresses. /32 = single host.

**Q: OSI model layers?**
7-Application, 6-Presentation, 5-Session, 4-Transport (TCP/UDP), 3-Network (IP), 2-Data Link (Ethernet), 1-Physical. Remember: "All People Seem To Need Data Processing."

## Quick Reference — Networking

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.


## Additional Reference

This topic has detailed content in adjacent sections. Check Overview for architecture, Fundamentals for core concepts, and Cheatsheets for quick command reference. Cross-reference with related topics in the same academy for complete understanding.

### Key Takeaways

- Understand the core architecture and design decisions
- Practice the commands and configurations hands-on
- Review interview questions before any technical interview
- Keep cheatsheets bookmarked for quick reference during work
- Connect this knowledge to adjacent tools in the same domain
