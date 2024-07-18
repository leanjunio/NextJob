import type { NextApiRequest, NextApiResponse } from "next";
import { supabase } from "../../lib/supabase";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
	if (req.method !== "POST") {
		return res.status(405).json({ error: "Method not allowed" });
	}

	const { email, password, role } = req.body;

	const { data: { user }, error } = await supabase.auth.signUp({ email, password });

	if (error) {
		return res.status(500).json({ error: error.message });
	}

	const { data, error: roleError } = await supabase
		.from("user_roles")
		.insert([{ user_id: user!.id, role }]);

	if (roleError) {
		return res.status(500).json({ error: roleError.message });
	}

	res.status(200).json({ message: "User registered succesfully", user });
}
