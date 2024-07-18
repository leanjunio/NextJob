import "@testing-library/jest-dom";
import Register from "@/app/auth/register/page";
import { render } from "@testing-library/react";

describe("Register", () => {
  it("renders the form as expected", () => {
    const { getByLabelText, getByRole } = render(<Register />);

    expect(getByLabelText(/email/i)).toBeInTheDocument();
    expect(getByLabelText(/password/i)).toBeInTheDocument();
    expect(getByRole("button", { name: /submit/i })).toBeInTheDocument();
  });
});