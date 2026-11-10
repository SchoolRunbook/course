# Project: Observation Feedback
 
Principal Denise takes rough notes during classroom observations, then has to turn them into structured feedback and email it. Today you build a workflow that does this from your team's plan, using what you learned from interviewing her and a prompt you write yourself.
 
Complete the steps in order:
 
1. [Start from your team's plan](#1-start-from-your-teams-plan)
2. [Set up your workflow](#2-set-up-your-workflow)
3. [Get everything into your AI node](#3-get-everything-into-your-ai-node)
4. [Write your prompt and check the output](#4-write-your-prompt-and-check-the-output)
   
## 1. Start from your team's plan
 
**Why:** your plan decides what each step does and whether a person, a rule or AI does it. You build from it.
 
**Steps:**
 
1. Open the [Class 3 Team Planning Slides](https://docs.google.com/presentation/d/1OUPu7oKl2TmyrRkbnmMj2yb_whz3amqISOFPL0yClDE/edit) and find your team's slide.
2. Check that every step is marked Person, Rule or AI.
   
You can change your plan as you build. If you heard an idea from another team that you want to borrow, add it.
 
## 2. Set up your workflow
 
**Why:** you build in your own workflow and test it with Denise's sample notes and past emails.
 
**Steps:**
 
1. Open the [Class 3 Samples](https://drive.google.com/drive/folders/1klHIHG5bIld5t8yj1IG0_TSqx1XSQlkH) folder. It has three raw observations and two past observation emails from Denise.
2. In the [SchoolRunbook n8n workspace](https://schoolrunbook.app.n8n.cloud/home/workflows), create a new workflow called `Observation Feedback - [your name]`.
   
> [!IMPORTANT]
> **Build it yourself.** You can ask AI how a specific node works, such as "What do the Anthropic node settings do?" Don't ask AI to design or build your workflow.
 
## 3. Get everything into your AI node
 
**Why:** your AI node can only use what's in its prompt. It needs three things: your instructions, the past emails (as examples) and the raw observations. These steps get all three there quickly, so you can spend your time on the prompt and on checking what the AI writes.
 
**Steps:**
 
1. **Add an Edit Fields node** and name it **Past examples**.
   - Add a field called **Past observation email 1**, type **String**. Switch the value from **Fixed** to **Expression** (the toggle is at the top right of the box), then paste the full text of the first past observation email as the value.
   - Add a second field, **Past observation email 2**, type **String**. Switch the value from **Fixed** to **Expression**, then paste the full text of the second past observation email as the value.
   - Execute the step. You should see one item with two fields.
2. **Add a Google Docs node** and choose **Get a document**.
   - Connect your Google account, paste the link to the first raw observation, and make sure **Simplify** is on.
   - Execute the step. You should see a **content** field holding the notes as text.
3. **Put all three into your AI node's prompt.**
   - Switch the **Prompt** box from **Fixed** to **Expression** and write your instructions.
   - Add a label, like "Past email 1:", and drag **Past observation email 1** in from your **Past examples** node. Do the same for **Past observation email 2**.
   - Add another label, like "Notes:", and drag **content** in from the Google Docs node.
   - Click inside the **Prompt** box. A preview shows your instructions with the past emails and the raw observation filled in.
     
**Done when:** the preview under your prompt shows your instructions, both past emails and the notes from the first raw observation.
 
## 4. Write your prompt and check the output
 
**Why:** this is where most of today's work is. Everything you heard from Denise goes into your prompt, and you check that the AI sticks to her notes.
 
**Steps:**
 
1. Write your own instructions in the AI node's prompt.
2. Add a Gmail node that sends the email to yourself while you test.
3. Click **Execute workflow**. To test the other two raw observations, change the link in the Google Docs node and run it again.
4. Check each email against its notes. Did the AI stick to the notes? What did it add or get wrong?
   
**Tips:**
 
- **Email stops mid-sentence:** raise the token limit. In the AI node, open **Options** and set **Maximum Number of Tokens** to about 6,000.
- **Output hard to read:** switch the output panel to **Table** or **Schema**, or read the email in your inbox, so you see it the way Denise would.
- **Something wrong:** trace it back through the nodes. Is the problem the prompt, the input or the plan?
  
**Done when:** all three raw observations produce an email in your inbox, and you've checked each one against its notes.
 
## Homework
 
Finish today's build before Class 4 on Tuesday, Nov 17 at 3:00pm ET. Finish your workflow, run all three raw observations through it and check each email against its notes, as in [step 4](#4-write-your-prompt-and-check-the-output).
 
## Getting help
 
**Stuck?** Ask Claude how a specific node works, but not to design or build your workflow.
 
Still stuck? [Book office hours](https://schoolrunbook.fillout.com/schoolrunbook-office-hours), or email coaches@schoolrunbook.com.
 
