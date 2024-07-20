type ContainerProps = {
  children: React.ReactNode;
}

export default function Container({ children }: ContainerProps) {
  return (
    <div className="container py-10 mx-auto">{children}</div>
  );
}