import Hero from "@/components/home/Hero";
import StatsSection from "@/components/home/StatsSection";
import AcademyGrid from "@/components/home/AcademyGrid";
import LearningPaths from "@/components/home/LearningPaths";
import FeaturedLabs from "@/components/home/FeaturedLabs";
import AIAssistantTeaser from "@/components/home/AIAssistantTeaser";
import TroubleshootingPreview from "@/components/home/TroubleshootingPreview";
import CertificationsSection from "@/components/home/CertificationsSection";
import JourneySection from "@/components/home/JourneySection";

export default function Home() {
  return (
    <>
      <Hero />
      <StatsSection />
      <AcademyGrid />
      <LearningPaths />
      <FeaturedLabs />
      <AIAssistantTeaser />
      <TroubleshootingPreview />
      <CertificationsSection />
      <JourneySection />
    </>
  );
}
