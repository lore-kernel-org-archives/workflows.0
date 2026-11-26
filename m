Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713573;
	b=FVeNbWqp+CDzijVBcwLkiVxFH05qWWXG2S+MRnQtdaa7Zgh40Ewuvq1avhpDOLnPRDii
	 wiBzuqHKzCU2FgcvWNlibYWfUFDwyg0ACTnCCBgopqJKM60sAGpyheb0VCAsg8krdvZAR
	 d9sRtTt0EJu6BaDzHNQd5fT50sGxdBroOooHbEKSQCLm2uCy34zcviGlTkq7fuWUgOktR
	 kyqdBzpHqK/sKxFqNN/Ac1Tl4NSS/ieGW6lM/wlV+ZVkOMpJkdFdAl9UnmkrzBI/5aCRY
	 vn5zekLKc4IAgJOscaQGCWeV4SUySNADN9BTFGXw+VQUz/VGt4pkfGiXtQQ0J5DREsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713573;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DPnOnHKLK8khpk5xKoTeQ5iPnwMY3CVcKZpPvk4R/Nk=;
	b=QYzg3lp37oz+OTCAZNd2zfZFbTpzVsb64FHfvZyvUbB5HWM0LEOulKvqgmwxzGz8UJ2l
	 f2LCqjnArLEbUahhz2fdYMjvPjEw9O2LmYeFGYV+fwjbTUxKeJNrR51j136AyJvfMsvym
	 uwyuAgQnvJW0NQydjuvzs8mSUSMyYOGReyAMygsXOz5DvWFETZZIgVSIybzsWFikXoiXI
	 ESalTAgZF39v9MwbmKyVQ/NPEbW6HkOIQrBaMW9gE9zeB22NHds2bQbKxZoGfRW/O3SpY
	 9OojyCHDisHXuVbmkK39n+NciEFIYxM4HCV3CNViKVVzay4wzGXX6bMNNkksEJe0E9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJ9eItCN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8F606A31C;
	Thu, 26 Nov 2026 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJ9eItCN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4851F000D1;
	Thu, 26 Nov 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713572;
	bh=DPnOnHKLK8khpk5xKoTeQ5iPnwMY3CVcKZpPvk4R/Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mJ9eItCNFg3ql+Qd01AlEJ9/YIMrNIkqxxDv2l/GUJ97xyemQcB1tipi4u8dt/aHL
	 AQj8a3vcX1KUhDarIozeqgoY1CeQc2Mw27ssDzjAHBrXj3SqBRjaBSZM+fdmtvxpaF
	 ym0C6IRnqgN95BsXCPeJEfmE7O4d6Y7yvM/6uyQTvWAqmAIBbu5jQ+WTPktt6nVoZ0
	 +6O1G5KY+d0uC9drvXQcay5xfwF6XDJJrotjbC6JyabhgG543hv3EnTG+gq8U31Gx0
	 gBoYa0/hqJcpOv6ttql+Z1t/9wf9dhTyO8zEiy4C66e3ZGtEAR2eyZ2tx+QXAsiauc
	 45nzJ8q2oaCEw==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>,
	Leon Romanovsky <leon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Borislav Petkov <bp@alien8.de>,
	Marc Zyngier <maz@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and a cover letter
Date: Thu, 26 Nov 2026 12:19:24 -0500
Message-ID: <20261126171926.2766137-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126171926.2766137-1-sashal@kernel.org>
References: <20261126171926.2766137-1-sashal@kernel.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit messages written by AI coding assistants are too long.
Maintainers keep asking for them to be cut down [1][2][3][4]: they read
like a copy of the assistant's analysis and bury what a reader needs.
When an assistant does trim, the opposite problem shows. A few lines of
a backtrace do not tell a reviewer how the failure was produced, and
Leon Romanovsky showed a case where only the full log revealed that the
crash came from an out-of-tree module written to provoke it [5]. Willy
Tarreau suggested a short quote in the changelog plus the full log
attached [6].

Give each kind of content its place. Add a "Commit message" section
that asks for a message that is to the point, and point it at "Patch
formatting and changelogs" in 5.Posting.rst, which asks for "the most
direct and concise way possible". Step 6 of the procedure asked for a
"detailed" message, which reads as a request for length: drop the word
and refer to the new section.

Everything else goes into a cover letter. Require one for every patch
or series prepared with an AI assistant, a single patch included, and
list what it has to contain: the base commit and whatever was added to
the tree to trigger the problem, how the problem was found, whether it
was seen to happen, the reproducer, how the change was tested, the
complete output that shows the problem, and what could not be done. The
output has to be the captured one, unedited, and whatever the commit
message quotes has to come from it. The items are a minimum: what a
cover letter usually holds can be added to them. Make writing the cover
letter a step of the bug fixing procedure, and say that a patch without
it is not finished.

security-bugs.rst does not allow a reproducer on a public list. For a
bug that is or may be a vulnerability the cover letter therefore only
says that one exists, and the cover letter step comes after the step
that tells a vulnerability from a regular bug.

The cover letter is posted with the patch and stays in the list
archive. The Link: tag of the applied commit, or a lore search for its
patch-id, leads from the commit to the thread, so the full log can be
found from the git history without being part of it.

Link: https://lore.kernel.org/r/2026073057-moustache-unfixable-5ab1@gregkh [1]
Link: https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com [2]
Link: https://lore.kernel.org/r/861pf9xgkc.wl-maz@kernel.org [3]
Link: https://lore.kernel.org/r/20261121195920.573a0727@jic23-hlaptop [4]
Link: https://lore.kernel.org/r/20261125125739.GA14811@unreal [5]
Link: https://lore.kernel.org/r/av7tY64O34gbJvH_@1wt.eu [6]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst | 86 ++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index ef01ce8d0ff91..98a72561a9c2b 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -40,6 +40,84 @@ is responsible for:
 * Adding their own Signed-off-by tag to certify the DCO
 * Taking full responsibility for the contribution
 
+Commit message
+==============
+
+The commit message **MUST** be to the point. "Patch formatting and changelogs"
+in Documentation/process/5.Posting.rst asks for a changelog that conveys what
+its readers need "in the most direct and concise way possible", and "Describe
+your changes" in Documentation/process/submitting-patches.rst says what that
+is. Keep the message as short as its content allows. Leave out markdown,
+labels such as "Root cause:", a restatement of the subject, lists of what was
+checked and the story of the investigation. Quote only the few lines of a log
+that identify the problem, see "Backtraces in commit messages" in
+Documentation/process/submitting-patches.rst.
+
+What reviewers need to check the work, and what does not belong in the git
+history, goes into the cover letter.
+
+Cover letter
+============
+
+Every patch or series prepared with an AI assistant **MUST** come with a cover
+letter, the "[PATCH 0/N]" mail that the patches are sent as replies to. This
+includes a single patch; tool use that
+Documentation/process/generated-content.rst puts out of scope does not count.
+The cover letter holds the evidence that reviewers need to check the work. It
+is posted with the patches and stays in the list archive.
+
+The cover letter **MUST** contain the following items, in this order. Do not
+drop an item: if there is nothing to say, write that. For a series, say which
+patch each item is about.
+
+1. The commit ID the work was done on, the architecture and configuration, and
+   everything that was added to that tree to trigger or observe the problem:
+   other patches, out-of-tree modules, fault injection, debugging code.
+2. How the problem was found: a report (give the link), a test, a tool, or
+   reading the code. Name the tools that were used, as
+   Documentation/process/generated-content.rst asks.
+3. Whether the problem was seen to happen: on the unmodified tree, only with
+   the additions from item 1, or never (found by analysis only).
+4. The reproducer, or the exact steps that trigger the problem. See below for a
+   bug that is or may be a vulnerability.
+5. How the change was tested: the commands, and the results without and with
+   the change. Leave out the output of successful builds.
+6. The complete output that shows the problem. For a runtime failure this is
+   the kernel log from boot up to and including the failure; for a build
+   failure, a failing test or a tool report it is all the output of that
+   command.
+7. What could not be done: not built, not booted, not tested, no reproducer.
+
+The output in item 6 **MUST** be what was captured, copied as is. Do not retype
+it, trim it, reorder it, or write what it would probably look like. If it is
+too large for one mail, do not cut it:
+Documentation/admin-guide/reporting-issues.rst says what to do with such
+files. If the problem was never triggered there is no such output, and item 6
+says so.
+
+Every line of output that the commit message quotes **MUST** come from the
+output in item 6.
+
+These items are the minimum. The cover letter can also hold what a cover
+letter usually holds, such as the introduction to a series (see
+Documentation/process/5.Posting.rst) and the changes since its previous
+version, placed before the items. Whatever else is in it, the items **MUST**
+be there. The story of the investigation does not belong in it either.
+
+Complete logs can contain host names, addresses, serial numbers and command
+lines. Tell the submitter, who reviews the cover letter like the rest of the
+contribution and sends it together with the patches.
+
+A bug that is or may be a vulnerability, see step 9 of the procedure below,
+gets its cover letter like any other, but a reproducer for it does not go to a
+public list. Item 4 then only says that a reproducer exists.
+Documentation/process/security-bugs.rst says what else is prepared and who
+receives it, and takes precedence wherever the two documents differ.
+
+A patch without its cover letter is not finished and must not be reported as
+done. Maintainers can expect the cover letter, and may ignore patches prepared
+with an AI assistant that arrive without one.
+
 Procedure for finding and fixing bugs
 =====================================
 
@@ -63,10 +141,11 @@ these steps:
    re-running a complete analysis; drop any fix that doesn't work and try
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
-6. Commit the working fix with a detailed message describing the problem, its
+6. Commit the working fix with a message describing the problem, its
    user-visible impact (see "Describe your changes" in
    Documentation/process/submitting-patches.rst), the solution and a Fixes
-   tag. Do not add a Signed-off-by tag.
+   tag. Keep it to the point, see "Commit message" above. Do not add a
+   Signed-off-by tag.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
@@ -77,3 +156,6 @@ these steps:
    review (the assistant must never send anything itself). Regular bugs are
    submitted as described in Documentation/process/submitting-patches.rst,
    vulnerabilities as described in Documentation/process/security-bugs.rst.
+10. Write the cover letter described in "Cover letter" above from what the
+    previous steps produced. This part is not optional, not even for a single
+    patch or a one-line fix.
-- 
2.53.0

