# Agent Rules for comic-guide-skill

When this skill is loaded, the agent should:

1. Read `SKILL.md` for the complete workflow instructions
2. Reference `references/styles.md` for style-specific image generation prompts and character descriptions
3. Reference `references/prompt-template.md` for prompt writing conventions
4. Use `examples/openclaw-guide/` as a reference for the expected output quality (PNG images)
5. Generate AI-drawn comic images (PNG), NOT HTML pages
6. Follow the workflow: content analysis → storyboard → character definition → image prompts → AI image generation
7. Use the platform's image generation capability (Cursor GenerateImage, baoyu-imagine, etc.)
