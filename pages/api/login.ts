import { supabase } from "@/lib/supabase";
import { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method !== "POST") {
		return res.status(405).json({ error: "Method not allowed" });
	}

  const { data, error } = await supabase.auth.signInWithPassword({ email: req.body.email, password: req.body.password });

  if (error) {
    return res.status(400).json({ error: error.message });
  }

  res.status(200).json({ data });
}