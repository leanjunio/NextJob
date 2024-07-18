import Container from "@/components/custom/container";

type AuthLayoutProps = {
  children: React.ReactNode;
}

export default function AuthLayout({
  children
}: AuthLayoutProps) {
  return <Container>{children}</Container>;
}