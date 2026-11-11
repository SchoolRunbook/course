# Project: Observation Feedback

> [!IMPORTANT]
> We created plans together in class. For Homework, you can follow your team's plan or take another approach. 
> Two of our TA's demo'ed their own approach to solving the problem which you can see in this <a href="https://youtu.be/7pPeq-u-tEo" target="_blank">video</a>. 
 
Principal Denise takes rough notes during classroom observations, then has to turn them into structured feedback and email it. Today you build a workflow that does this from your team's plan, using what you learned from interviewing her and a prompt you write yourself.
 
Complete the steps in order:
 
1. [Start from your team's plan](#1-start-from-your-teams-plan)
2. [Set up your workflow](#2-set-up-your-workflow)
3. [Build your workflow](#3-build-your-workflow)
   
## 1. Start from your team's plan
 
**Why:** your plan decides what each step does and whether a person, a rule or AI does it. You build from it.
 
**Steps:**
 
1. Open the <a href="https://docs.google.com/presentation/d/1OUPu7oKl2TmyrRkbnmMj2yb_whz3amqISOFPL0yClDE/edit" target="_blank" rel="noopener noreferrer">Class 3 Team Planning Slides</a> and find your team's slide.
2. Check that every step is marked Person, Rule or AI.
   
You can change your plan as you build. If you heard an idea from another team that you want to borrow, add it.
 
## 2. Set up your workflow
 
**Why:** your team builds one workflow together in class, so one person builds while everyone else helps decide what to do.
 
**Steps:**
 
1. Pick one person on your team to build. They share their screen and work in n8n. Everyone else talks through the plan with them.
2. Open the <a href="https://drive.google.com/drive/folders/1klHIHG5bIld5t8yj1IG0_TSqx1XSQlkH" target="_blank" rel="noopener noreferrer">Class 3 Samples</a> folder. It has three raw observations and two past observation emails from Denise.
3. In the <a href="https://schoolrunbook.app.n8n.cloud/home/workflows" target="_blank" rel="noopener noreferrer">SchoolRunbook n8n workspace</a>, the builder creates a new workflow called `Observation Feedback - Team [number]`.
   
> [!IMPORTANT]
> **Build it yourself.** You can ask AI how a specific node works, such as "What do the Anthropic node settings do?" Don't ask AI to design or build your workflow.
 
## 3. Build your workflow
 
**Why:** you decide which nodes your workflow needs. You'll have a lot of nodes, but roughly four things have to happen: kick off the workflow, give Claude past examples, give Claude raw observations, then finish.
 
**Steps:**
 
1. Follow your plan to build the workflow, one step at a time.
2. When you get to giving Claude past examples and raw observations, use the [sample steps](#sample-steps-give-claude-past-examples-and-raw-observations) below.
   
**Done when:** your workflow turns a raw observation into a feedback email.
 
### Sample steps: give Claude past examples and raw observations
 
Your AI node can only use what's in its prompt. Besides your instructions, it needs the past examples and the raw observations. There are lots of ways to get them there. We've provided these sample steps to make these parts easier, but you can do it another way if you prefer.
 
1. **Give Claude past examples**
   - Add an **Edit Fields** node and name it **Past examples**.
   - Add a field called **Past observation email 1**, type **String**. Switch the value from **Fixed** to **Expression** (the toggle is at the top right of the box), then paste the full text of the first past observation email as the value.
   - Add a second field, **Past observation email 2**, type **String**. Switch the value from **Fixed** to **Expression**, then paste the full text of the second past observation email as the value.
   - Execute the step. You should see one item with two fields.
   - In your AI node, switch the **Prompt** box from **Fixed** to **Expression**. Add a label, like "Past email 1:", and drag **Past observation email 1** in from your **Past examples** node. Do the same for **Past observation email 2**.
2. **Give Claude raw observations**
   - Add a **Google Docs** node and choose **Get a document**.
   - Connect your Google account, paste the link to the first raw observation, and make sure **Simplify** is on.
   - Execute the step. You should see a **content** field holding the notes as text.
   - In your AI node's prompt, add another label, like "Notes:", and drag **content** in from the Google Docs node.
     
Write your own instructions in the prompt around these. Then click inside the **Prompt** box. The preview shows your instructions with the past examples and the raw observation filled in.
 
Once it works for one raw observation, test the other two by changing the link in the Google Docs node and clicking **Execute workflow**.
 
**Email stops mid-sentence?** In the AI node, open **Options** and set **Maximum Number of Tokens** to about 6,000.
 
## Homework
 
Everyone finishes their own workflow before Class 4 on Tuesday, Nov 17 at 3:00pm ET, even if someone else built it in class.
 
1. Finish your workflow.
2. Run all three raw observations through it.
3. Check each email against its notes. Did the AI stick to the notes? What did it add or get wrong?
   
## Submit your homework
 
> [!IMPORTANT]
> **Submit before class on November 17.**
>
> Export your workflow as a JSON file, then <a href="https://forms.gle/A6tCyBBvmNSi3bMB8" target="_blank" rel="noopener noreferrer">submit it using this form</a>. In the form, tell us whether the AI stuck to the notes.
>
> <a href="project-1-ai-automation.html#export-workflow-json" target="_blank" rel="noopener noreferrer">Find instructions here on how to export your JSON file.</a>
 
## Getting help
 
**Stuck?** Ask Claude how a specific node works, but not to design or build your workflow.
 
Still stuck? <a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">Book office hours</a>, or email coaches@schoolrunbook.com.
