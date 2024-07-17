-- Insert sample users into auth.users (assuming this table exists)
INSERT INTO auth.users (id, email) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'emily.chen@email.com'),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'michael.rodriguez@email.com'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'sarah.patel@email.com'),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'contact@innovatetech.com'),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'hr@globalsoft.com'),
    ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'admin@techjobboard.com');

-- Insert candidates
INSERT INTO candidates (id, full_name, email, headline, bio, skills, github_url, linkedin_url, portfolio_url, profile_picture_url) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Emily Chen', 'emily.chen@email.com', 'Full Stack Developer', 'Passionate about creating efficient and user-friendly web applications.', ARRAY['JavaScript', 'React', 'Node.js', 'Python'], 'https://github.com/emilychen', 'https://linkedin.com/in/emilychen', 'https://emilychen.dev', 'https://example.com/emily.jpg'),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Michael Rodriguez', 'michael.rodriguez@email.com', 'UX/UI Designer', 'Dedicated to crafting intuitive and visually appealing user interfaces.', ARRAY['Figma', 'Adobe XD', 'Sketch', 'User Research'], 'https://github.com/michaelrodriguez', 'https://linkedin.com/in/michaelrodriguez', 'https://michaelrodriguez.design', 'https://example.com/michael.jpg'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Sarah Patel', 'sarah.patel@email.com', 'Data Scientist', 'Leveraging data to drive business decisions and create impactful solutions.', ARRAY['Python', 'R', 'Machine Learning', 'SQL'], 'https://github.com/sarahpatel', 'https://linkedin.com/in/sarahpatel', 'https://sarahpatel.io', 'https://example.com/sarah.jpg');

-- Insert companies
INSERT INTO companies (id, name, description, website_url, logo_url) VALUES
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'InnovateTech Solutions', 'Pioneering software solutions for tomorrow''s challenges.', 'https://innovatetech.com', 'https://example.com/innovatetech-logo.png'),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'GlobalSoft Systems', 'Empowering businesses through cutting-edge software and services.', 'https://globalsoft.com', 'https://example.com/globalsoft-logo.png');

-- Insert jobs
INSERT INTO jobs (company_id, title, description, requirements, location, job_type, experience_level, salary_range, expires_at) VALUES
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Senior Full Stack Developer', 'Join our team to build scalable and innovative web applications.', ARRAY['5+ years experience', 'React', 'Node.js', 'AWS'], 'Remote', 'Full-time', 'Senior', '$100,000 - $150,000', CURRENT_TIMESTAMP + INTERVAL '30 days'),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'UX Designer', 'Help shape the future of our products through user-centric design.', ARRAY['3+ years experience', 'Figma', 'User Research', 'Prototyping'], 'New York, NY', 'Full-time', 'Mid-level', '$80,000 - $120,000', CURRENT_TIMESTAMP + INTERVAL '45 days'),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Data Scientist', 'Utilize advanced analytics to drive product improvements and business strategies.', ARRAY['ML expertise', 'Python', 'SQL', 'Data Visualization'], 'San Francisco, CA', 'Full-time', 'Senior', '$120,000 - $180,000', CURRENT_TIMESTAMP + INTERVAL '60 days');

-- Insert applications
INSERT INTO applications (candidate_id, job_id, cover_letter, status) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', (SELECT id FROM jobs WHERE title = 'Senior Full Stack Developer'), 'I am excited to apply for the Senior Full Stack Developer position...', 'applied'),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', (SELECT id FROM jobs WHERE title = 'UX Designer'), 'As a passionate UX Designer with a keen eye for detail...', 'in_review'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', (SELECT id FROM jobs WHERE title = 'Data Scientist'), 'I believe my strong background in data science and machine learning...', 'applied');

-- Insert user roles
INSERT INTO user_roles (user_id, role) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'candidate'),
    ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'candidate'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'candidate'),
    ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'company'),
    ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'company'),
    ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'admin');