Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.64.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588127;
	b=1QMyBeB9uJU4/JAMW+FiJAOJSdNKStguPmohyJVAsNCUGHfXeVf/M6qSYBl3AoNSg1aP
	 JTBsMDUkNHvOKZxwUTDq2x3Mp6fgdyuxtJih3Q3zBmFgd9L5o4aJhl72sE9Jvn39vKZ8b
	 FB/35E8yIhPaNntmrGxBCigZgM/yRiWUhuNkudIkp+kFgGyVG6OtxEjPmzikiiNFUR8ID
	 1c0nZtVp4s6X5O7+/xHTws6Y0EG0kUt/4Y7J82PyaD3vWx9/SEFTCL2p/GIxNwtFuA5bz
	 9CpO1Y+OpK1kolqpBkWMBUIiEo0qK4x8SMJ55ImW5tQjKBSNeJObzs4qbs1+vv85W1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588127;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:To:Cc:Subject:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:From:References:
	 X-Mailer;
	bh=E0eWOcYTqBWLqFRgRTdzxD7jH9P+/JMBYE77aiXNxpI=;
	b=scE+5G20iFuv1GQROYtRXTapeYL3+XZ7pDzFYW5wpubU9kmSNVtIgzykemXGDXlnR7CP
	 MH2Y4EHUf9LtPC/K17swrfZfPyBn2pksolBG9xyl83ksCkIOf3eZVdChoW0JmXzgoQ1+r
	 LeepP9S15bhon7wri87rqtoG2tMByzY0Vm9vEpjd2FtcqAblK8NjXqXbQxpyExS+JfO2a
	 zjd2Ywdm/kxHS71uT6iHhyaqxO3fEPKxkcULgvpXeUEu8zCifdORj4QRAAYJty/m2c2w4
	 lQT8UbxD+/ns8LPpqye4OuQpl4xEsgQAZJox5YsYFpm5iQJWVZLx6NR2ZYCZXw38rfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=k2vn8qI+;
	arc=none smtp.remote-ip=34.2.64.18
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com [34.2.64.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61B606A323
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 06:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E61B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=k2vn8qI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795588125; bh=E0eWOcYTqBWLqFRgRTdzxD7jH9P+/JMBYE77aiXNxpI=; h=To:Cc:Subject:Date:Content-Type:From:References:From:Subject:Reply-To:Content-Type; b=k2vn8qI+JSj+aMfN3pexqIquNsBWeT9a7sdzWAwPcM5pOoiCrvYVn7JajFavSVG1LfjvcNY+r93WzeTQpk7CY/aHnnX9AE5IiNKEK5Wabjlh9p8EV0vPZNDUJMeT0ehgpLEMF6Y+TN5SZKGYW8K9OvfonhHFgQMIq9DrTkwXwGWnvvawzpaNPDJuJm2QYQUoSpdxf7g0T0llY7MM3UmqtTRSSAoTHyU1G3xK80Fe1QAUklyW9y2FyL1NbpB3M7pQqP24sFarOjVWW4s/1Vq5sApnS3aF1C1KvKADNBeahyRKK1yVjbhv6aKNSH5jlHKTGQzlSyynj4FJlKA3vMiKKA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795588125; bh=WhW9bEyPRtp5yCFOJSF+dbcfrxEuhJxNlvsZof/BVv7=; h=X-Sonic-MF:To:Subject:Date:From:From:Subject; b=nhhkE1Ztk/8IABdJxNWFeUz0ruiFWxxQqAzVtuiIXSBmX4GUOyiPYdEx2KV6n9GiDeScZTBfMt/ksmsJomzO6tnaSQPOAY0VAYE+GJAMZphHzSayMitlbxZMZ5Ge4UxCvDPBhOvgN3uXhHiPxvavxdLSxLWXqfxkFQhQDJ2d/jh3bMFi4Ey4BdF8cNAgbPhbnciWNgV9RAGWPPo9wFB1knxP8LE+iKSB92Lxejn6yk8IJioEw14Og6w+Lpy57/AU+fMqs4hh4/a7bhiNtTuvjckD/a8UsQ9i4sF824RGYiQNHS2wibZv96tLtSypfRvkSzkweNlfYu82gtGki4V5RA==
X-YMail-OSG: mP95MyIVM1n9xjGwOcqI319ou3oxU0ojvlwKK8XWKrmu3QrHGWOfE_qIr7P44bO
 JTLQVG2VlmdErcSduY2T29X_Io240sYf.KdXP7_1wnV2iCgTcCaZPgwMF7qA11JIHrvcEn9.fNZ4
 ge0HK6_dhodpa8lgnXyKby8StAvlplS3CeSevi5u6A3hh4q4N8T9VxrwL3gGBgZgYcOEeCGZ7KYm
 d_d78ZicxJMjqV38LEwoxy_W3YhgDme_ky19llCHE6pOHAh7NlMysLa4xc7cjvWgI1UBgjPn5B7J
 FA2OaZkxSt1qTSdm.7HPgbxk4lyuDEstptVGZUakBI7aOyUJTtb7hhz7QfhiuLYIHvvZx3NsPd9U
 S1ZiXnzdB_kycWJSP4p6BCb0.2Fp_30uF7tUv0pPjZ7NGgB0k.FfH8lMNWmKhaTRvUAmtEEt.Vb6
 DDwTbUZH511b5TwgEtrM8xwohKACSgxt81EWfBkgOO4T8lS5AIc.2kymnVbTtCjrTGOxsKXCnkJ4
 Jxm8h_MVrjgNF9gHwgntNhFgjW2GYfZdMzqUKVGMVV0JqeYMCk.znR7fWxW1IIZguaQdEm2BMqKO
 mOsfDGGE5jHTCk8WauZXYwYPeCMmw18gu06ygK_BfW5_4MhcI7OJnaFq1mseX0eDm3a0RRb.e7P2
 73rMDT6Bkhs9S8N1bSCt011f4vmNoQk0PKxxtfwP8iU9nJDSWvlPm.ALcOg6hwf_GBnvzLdi1lL5
 86cPZB2TnOcI13xWya12xrVfMtBCCgp0UJ3RfEc.jaRHEqtanlbahrX3bmlpUKmIUig6aTQheSl4
 SB5PncLDK0wi8Cvd9BdVTf6MBYvDrmeV77zxaKLt3h16H4qVpcM9FV51GHriVWQWlAJR9_.0fEcx
 nNV73LaLST_SO39zuErKGwI1H6QFVSBjQxwtg6TRoA80WY3NfrQb4AXQSTV9TszVHPGfKpYmj9MI
 I49mNVJdiCNJEzRKX713flPqu05M0AIPgE_dx8TKcpdfpmD7xh.UfzNr61PPQW12T_4PTB2dfPN8
 dcl2x8Qo2TKWLyEwpGBnVJ2hqBFEK87uJNEfTPo2ppRSMCSzGpmqIYFbKTmtng7xttMm1NIAZKgv
 RbLgWtcl5ab3ZM8wsI32enC269bOeEAY9itRVUpjX7JVw8iugGqtN3UYgPStqVdJGdoYc_CFZi48
 bydFK6CgIhKd_TwiO_mK7D0Efx9mgjYE6VOvPdBTRygL4vwn7Y9keF4g9nwHAB0PYemJWVxOz7PS
 tpnZkw1ZX3z7veniGuBOY19Lk_07glvxFJJnrldk7KymWe8MEFhmy6ad6aAH1hWG16FY3_xYR0Pa
 MoGIqwLmtrmyX89ECY2gtd3zOoxcoQ1UhUyXevj5_nuL4ZXjwAqXkZjsZEt9ExUZT53LQsLsw5iF
 mT47jSnUM9wR1oV7ABjHSN.K_fYc6tE99GQ0RQaLzQ_LiVPz5Gm_wM_AWSXRz9pCHCXP1cirbhT0
 EryUBCyT0CWoK5MTiHkyd8oX9x22x0EssBYjYBSEbzg1ZGlWs1CWMZaM5beOfHrJFxKvLTt_jh.H
 OYHfozjMLpbC3f3prH59gGf9yKcmj5E.DRxC.nLFj.1_lTN8qEilyIkBsR6zm_zLaf5ConhMP.HE
 rks4cfn2nD58uD33nQlkwIbCo9ZoiKDyRRUQt2_qvf0cCloX4MClOVSmkP1NID_jQ9rDXNsKn1Jt
 QzqYUOfcyhGlp9EYUDdi8aqon7e0ROMsgTj0ROFuYUWUIXyam9jYib._POrYjLRNM0TmuugpdLmG
 BXrIbAfsJy7FNn_tYQEDgwIKkzY8JuEPOxvN_25DApgCGNqm.mN4LhgGjwNoG3YB0.fFEeYqPnK9
 8l0.riPZf4rxfs0KF5FVNsSMtZ2gDDxOWtFcSN53GzGbl5Y16VIe4gInxaThnKhMgWZYH0zQXylf
 e7l3M0vlt5dp4VVh2V43VG0NCkPrVASe.WjbSG50hMyfeIG0YRIO_ZiVwZDaiGKI05Os_j5sdw8r
 CYeeVEKpYghnIG7n7BvW8hSfgZh8jFhYKhrwe7jCH.Umq
X-Sonic-MF: <capitain_jack@yahoo.com>
X-Sonic-ID: 14d8404e-e460-48f7-9bae-303ebc9a4152
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-103 with HTTP; Wed, 25 Nov 2026 06:28:45 +0000
Received: from dip115.lsn.bf1.yahoo.com ([67.195.177.124])
          by hello (SMTP) with SMTP ID affdc4b9c5d43a215838c465b26809fe;
          Wed, 25 Nov 2026 06:28:39 +0000 (UTC)
To: Sasha Levin <sashal@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] agents: add a skill to determine the target tree of a change
Date: Wed, 25 Nov 2026 06:27:39 -0000
Message-ID: <179558805924.3383392.1456615917266025706@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel Ramos <capitain_jack@yahoo.com>
References: <179558805924.3383392.1456615917266025706.ref@yahoo.com>
X-Mailer: WebService/1.1.27100 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo

From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Whether a change goes into the current release during its -rc weeks or
waits for the next merge window is decided by hand, and being a fix is
often taken as enough. Linus asked that new development and test cases
be kept on a separate branch so that they can be merged during the merge
window, and noted that fixes for subtle bugs that went unnoticed for a
long time can themselves be buggy.

Add a skill that sends the agent to the parts of 2.Process.rst,
howto.rst and handling-regressions.rst that describe the cycle, and to
the maintainer profiles of the changed files, and adds the checks agents
tend to get wrong: reading where the cycle stands, using the kernel's
meaning of a regression, keeping fixes for old bugs, new tests, cleanups
and new development for the next merge window, splitting mixed changes,
and counting every added line when judging a change sent during the -rc
weeks. The skill proposes a target; the maintainer decides.

Most of the skill points at existing documents. Keeping new tests on a
separate branch for the merge window, and counting lines that are not
built by default, come from Linus's mail and are not in Documentation/
yet.

Point the bug-fix procedure in coding-assistants.rst at the skill.

Link: https://lore.kernel.org/r/CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com
Link: https://lore.kernel.org/r/CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com
Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
This applies on top of v5 of the agents series [1].

None of the skills there says where a change goes in the cycle: the current
release during its -rc weeks, or the next merge window.
This one sends the agent to the documents that already say it (2.Process.rst,
howto.rst, handling-regressions.rst, the maintainer profiles) and adds what
agents get wrong. It proposes a target and the maintainer decides.

Two of its rules are not in Documentation/ yet and come from Linus's mail [2]:
new tests and new development stay on a separate branch for the merge window,
and every added line counts when a change is sent during the -rc weeks, built
by default or not.
If you prefer those two in 2.Process.rst first, I can send that patch.

Sasha, would you take it into your respin, or should it wait until the series
lands?

How it was made: I use Claude Code (Claude Opus). It read the v1 to v5 threads,
Linus's two mails and the documents named in the skill, and wrote the skill and
the commit message. Each sentence was then checked against its source by a
script. checkpatch gives the same single MAINTAINERS warning as the other
skill patches. The skill has not been tried with an agent yet.

[1] https://lore.kernel.org/r/20261111225940.1573565-1-tytso@mit.edu
[2] https://lore.kernel.org/r/CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com

 Documentation/process/coding-assistants.rst |  5 +-
 agents/skills/target-tree/SKILL.md          | 66 +++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 agents/skills/target-tree/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index bb927fea5..a3da7453c 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -46,6 +46,8 @@ The following skills are available:
   message or cover letter, and writes the text of a pull request.
 * agents/skills/writing-kunit-tests/SKILL.md designs, writes, verifies, or
   reviews KUnit unit tests.
+* agents/skills/target-tree/SKILL.md proposes the tree and release a change is
+  for: the current release during its -rc weeks, or the next merge window.
 
 Licensing and Legal Requirements
 ================================
@@ -97,7 +99,8 @@ these steps:
    find-fixes skill, and a stable tag if the stable-tag skill calls for one. Do
    not add a Signed-off-by tag.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
-   Documentation/process/security-bugs.rst shows how to do that.
+   Documentation/process/security-bugs.rst shows how to do that. Determine the
+   tree and release the fix is for with the target-tree skill.
 8. Indicate what could not be done. If the fix could not be built or tested, or
    if no reproducer could be produced, say so explicitly: maintainers currently
    waste too much time analyzing unverified reports and untested fixes.
diff --git a/agents/skills/target-tree/SKILL.md b/agents/skills/target-tree/SKILL.md
new file mode 100644
index 000000000..fee4be202
--- /dev/null
+++ b/agents/skills/target-tree/SKILL.md
@@ -0,0 +1,66 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: target-tree
+description: >-
+  Decide which tree, branch and release a Linux kernel change is for: the
+  current release during its -rc weeks, or the next merge window. Use when
+  preparing a fix, a test, a cleanup or new development for submission,
+  when preparing a pull request, or when checking where a change should go.
+---
+
+# Determine the target of a change
+
+Read "The big picture" and "Next trees" in
+Documentation/process/2.Process.rst, "Mainline tree" in
+Documentation/process/howto.rst, and "Expectations and best practices for
+fixing regressions" in Documentation/process/handling-regressions.rst.
+Follow the maintainer profiles, the `P:` entries in MAINTAINERS, for the
+changed files; their trees, branches and cycle dates take precedence.
+Follow the rules for skills in Documentation/process/coding-assistants.rst.
+
+- Find where the cycle stands from the newest tag in Linus Torvalds' tree,
+  as "Development cycle" in Documentation/process/maintainer-netdev.rst
+  describes: after a release tag the merge window is most likely open,
+  after an -rc tag the release is being stabilized. Name the tag in the
+  result.
+- Being a fix is not enough to go into the current release. During the -rc
+  weeks it is meant for fixes of regressions, above all those introduced
+  in the current cycle, and of bugs that are urgent or critical. A bug
+  that has always existed is not a regression; its fix goes in only if it
+  is important. Everything else is for the next merge window.
+- Use the kernel's meaning of a regression, from
+  Documentation/admin-guide/reporting-regressions.rst: an application or
+  use case that ran fine with one kernel works worse or not at all with a
+  newer one.
+- A fix for a subtle bug that went unnoticed for a long time fixes
+  something rare, and can itself be buggy. Unless the bug is important,
+  propose the fix for the next merge window. It still reaches the stable
+  trees once it is in mainline, with the tag the stable-tag skill returns.
+- Do not hold a regression fix back for the next merge window unless the
+  fix is extraordinarily risky or the culprit was mainlined more than a
+  year ago. Report whether reverting the culprit would be the quicker and
+  less dangerous fix.
+- New development, new tests, cleanups and refactoring are for the next
+  merge window. Keep them on a branch of their own, and do not fold them
+  into a fix or a pull request for the current release. Split a change
+  that mixes them with such a fix, as "Separate your changes" in
+  Documentation/process/submitting-patches.rst asks.
+- Count every line a change adds when judging the risk of sending it
+  during the -rc weeks, including tests that are not built by default and
+  fixes for other bugs.
+- A pull request sent after the merge window, or with fixes that look
+  risky, explains its timing, as Documentation/maintainer/pull-requests.rst
+  asks. Whether a risky fix goes in days before a release is Linus
+  Torvalds' call, as handling-regressions.rst describes.
+- A change for the next merge window should be in the subsystem's tree,
+  and through it in linux-next, some time before the merge window opens.
+  Check the key cycle dates in the maintainer profile; after them, propose
+  the merge window after the next one.
+- Base the change on the tree and branch the maintainer profile names for
+  its target, and mark the target where the profile asks for it, as
+  `[PATCH net]` and `[PATCH net-next]` do in maintainer-netdev.rst.
+
+Return the tree, branch and release, the tag that showed where the cycle
+stands, and the reasons with the documents they come from. The maintainer
+decides where a change goes. If the target cannot be determined, return no
+target and say what is missing.

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
prerequisite-patch-id: 774c0910c3ff50a2e5ef950cb1059edf20e61e30
prerequisite-patch-id: 4df6324f28893898e730b3c0ec7c4b6139731191
prerequisite-patch-id: 73cecd1860937722f43ce4dcd0b0515e4052a3df
prerequisite-patch-id: 7eddf81879b882b0877f3ad6da6c54755c4d4209
prerequisite-patch-id: 51559949fc320fa3be648e50755afb3dcbd8df91
prerequisite-patch-id: b9b23ba3acde59f30659dc2b07c9ab079ea8d72c
-- 
2.53.0

