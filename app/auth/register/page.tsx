"use client";

import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { registerSchema } from "@/lib/schemas/api/register";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { useToast } from "@/components/ui/use-toast";
import { ToastAction } from "@/components/ui/toast";

type RegisterData = z.infer<typeof registerSchema>;
export default function Register() {
  const { toast } = useToast();
  const form = useForm<RegisterData>({
    resolver: zodResolver(registerSchema),
    defaultValues: {
      email: "john.doe@autodesk.com",
      password: "password",
    },
  });

  async function onSubmit(data: RegisterData) {
    try {
      const res = await fetch("/api/register", {
        method: "post",
        body: JSON.stringify(data)
      });

      if (res?.ok) {
        toast({
          title: "Welcome!",
          description: `${data.email} registered`
        });
      } else {
        const text = await res.text();
        console.log({ text });
        toast({
          title: "Registration failed",
          description: "Please try again later"
        });
      }
    } catch {
      console.error("an error occurred");
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <>
              <FormItem>
                <FormLabel>Email</FormLabel>
                <FormControl>
                  <Input placeholder="email" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            </>
          )}
        />
        <FormField
          control={form.control}
          name="password"
          render={({ field }) => (
            <>
              <FormItem>
                <FormLabel>Password</FormLabel>
                <FormControl>
                  <Input type="password" placeholder="password" {...field} />
                </FormControl>
                <FormMessage />
              </FormItem>
            </>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  );
}
