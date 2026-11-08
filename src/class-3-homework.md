# Class 3 homework: Oakfield Cover Desk

**Due Tuesday 17 November, 3 PM ET.** Write your own plan and prompt, then use Claude to help you build this workflow in n8n.

## Project story

Sam is the office manager at Oakfield School. When a teacher takes time off, Sam checks their leave allowance, searches the timetable and writes down every session that needs cover. A missed session can leave a classroom without its teacher.

Oakfield has 11 teachers and seven teaching assistants. It teaches Pre-K, K and Grades 1–3, each with sections A, B and C. Every session has a teacher and an assistant.

Build an automation that gives Sam a clear summary of each leave decision and the sessions an eligible absence affects.

**Workflow:** Record a leave decision → Check approved leave → Find affected sessions → Email the manager → Record that the manager was updated

## 1. Get your spreadsheet ready

1. Click <a href="https://docs.google.com/spreadsheets/d/1GaBTEm3bK6pN28dCPPtvzlktwh32xT-QVn1n3JQgag4/copy" target="_blank" rel="noopener noreferrer">Make a copy of Oakfield Cover Desk Project</a>. Sign in to Google if asked, then click **Make a copy** to confirm.
2. When your copy opens, click its name at the top and rename it **[your name] - Oakfield Cover Desk Project**.
3. Look through the four tabs. Keep their headings and IDs unchanged.

| Tab | What to look at |
| --- | --- |
| **Leave Requests** | Seven sample requests. **E: Approval status** and **F: Automation status** start blank. |
| **Staff** | Names, roles, certifications and subjects; **F: Experience years**, **G: Leave days left**, **H: Availability**. |
| **Timetable** | Dated sessions. Teacher, TA and Cover staff use labels such as **T01 - Amara Cole**. Cover staff starts blank. |
| **Week View** | A readable timetable and staff legend. The automation uses **Timetable** as its source. |

**Staff ID** connects the request, staff record and timetable. Use the ID at the start of a timetable label, not the person's name. **Request ID** identifies the request; **Session ID** identifies the lesson.

> [!NOTE]
> This fictional timetable covers **10–17 November 2026**, inclusive: six teaching days, excluding the weekend. It contains one sample session per section per day across three staggered blocks, rather than a full school day. All times are ET.

## 2. Understand the required workflow

You will act as the manager. When you are ready to test, open **Leave Requests**, click the dropdown in **column E: Approval status** on a request's row, and choose **Approved** or **Not approved**. You do not need to build a request form.

The automation should then:

1. Start when you select **Approved** or **Not approved** from a request's **Approval status** dropdown in column E, then read that row. Leaving the dropdown blank must do nothing and send no email.
2. For **Not approved**, email the manager confirming that no cover action was taken. Do not search for sessions.
3. For **Approved**, find the staff record and count requested weekdays, including both dates.
4. Check that the whole request falls within 10–17 November and the requested days do not exceed **Leave days left**. Zero remaining days means there is no leave available.
5. If both checks pass, find every session taught by that Staff ID during the requested dates.
6. Email **coaches@schoolrunbook.com**, acting as Sam's address. Include the teacher's name and ID, requested dates, days requested, leave balance and result. For a valid absence, list affected sessions with dates, times, classes and subjects.
7. Set **Automation status** to **Manager updated** after the email sends.

If a check fails, explain why. Insufficient balance means **needs review**; dates outside the sample period mean **outside the timetable window**, not denied leave. Report missing data or no matching sessions honestly.

> [!IMPORTANT]
> **Approval status keeps the manager's decision.** The automation must never change it. **Automation status**, in column F, shows progress: **Processing** while handling the request, **Manager updated** when the result email has been sent, or **Needs review** if processing cannot finish. Writing column F must not trigger another email. Skip an unchanged decision already handled.

Read leave balances without changing them. Do not assign cover, update the timetable or email the absent teacher. You do not need a separate Run Log for this homework.

## 3. Write your logic and your own prompt

1. Create a Google Doc named **[your name] - Oakfield Build Plan**.
2. Write the workflow in plain English, one step per line. Mark each step **Person**, **Rule** or **AI**.
3. Explain what starts it, the information each step needs, what happens when a check fails, and how it avoids sending the same email again.
4. Write your own prompt asking Claude to help build that plan. Include Sam's problem, your sheet link, the required outcomes and where the homework stops.
5. Save this original logic and prompt before asking Claude for help.

## 4. Build with Claude

1. Start an **Oakfield Cover Desk** chat inside your **SchoolRunbook projects** project in Claude, set up during <a href="https://schoolrunbook.github.io/course/prework.html#4-create-your-claude-project" target="_blank" rel="noopener noreferrer">prework</a>.
2. Send your prompt, logic document and sheet link. Review Claude's **Context** and **Design** before building.
3. Once you approve the Design, ask Claude for the complete **Build** guide with all milestones together. Save or download it. Create **[your name] - Oakfield Cover Desk - Homework** in n8n, connect your Google Sheets and Gmail accounts, and work through one milestone at a time.
4. Check the output against the sheet, including dates, balances, ID matching and the facts in the email.

## 5. Test your decisions

1. Set the workflow's email recipient to your own address while testing. Write down what you expect each request to do.
2. Leave **Approval status** blank on a request and confirm that it sends no email.
3. In column E, use the dropdown to select **Approved** for LR001–LR004, LR006 and LR007. Select **Not approved** for LR005.
4. Compare each email with the sheet: check the teacher, dates, leave days, affected sessions and result. Confirm that column E still holds your decision and column F shows **Manager updated** after the email sends.
5. Have the workflow read an unchanged completed request again. Confirm that it does not send another email.
6. For your final test, change the recipient to **coaches@schoolrunbook.com**. To repeat a sample, clear its **Approval status** first, clear **Automation status**, then select the decision again. Include your name and Request ID in each email subject.

## Submit your homework

> [!IMPORTANT]
> In your Build Plan Doc, choose **File → Download → PDF Document**. Upload that file, including your **plain-English logic** and **original build prompt**, through the <a href="https://docs.google.com/forms/d/e/1FAIpQLSfTDUwvMkP6TDJliJZKj3Ac6L8GBYBL2sdvzcVkNe4cgXJy2Q/viewform" target="_blank" rel="noopener noreferrer">project submission form</a>. Upload your **workflow JSON** too if it is ready.
>
> **Not finished by the deadline? Submit anyway.** Upload your Build Plan with at least your original prompt. You can submit your workflow JSON later.
>
> <a href="https://schoolrunbook.github.io/course/project-1-ai-automation.html#export-workflow-json" target="_blank" rel="noopener noreferrer">Find instructions here for exporting your workflow JSON.</a>
