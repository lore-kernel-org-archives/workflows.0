Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE9366079;
	Fri,  3 Apr 2026 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197246; cv=none; b=mfpFEVEyoy+yBNKkBDKwl20ZrOsb0X9lWy7HkMLGZeKW3b7nKb1A2ub7kz+6WMPM7XW5wxBJOYkGAJQ9j8yAukCNLvvzzqYs7zRW2DMuPmzBg/7gaO/9T6Kt32Vth7287W9+fTQbHq0csrLyYbfd/gMB4/RVm+AVfFOJavxsScI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197246; c=relaxed/simple;
	bh=CX5fvbfdCr2+GmJiW78tpM7ubdGx/BZsicNUbEJ1hy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mg/nAcMEEY7JtNuqaUnTIk9Dg2jDh81Wgus74qg5JEd9y8U+/bikayQmf7vL56brSeT8sI6drHIwqqn86lvjZYzNnDnOnZFktrD4vHXzlPbbvvEQn0fsjG/GQs6pQqwZg0gKJf6IYcJ8TD28zQAiXGJ6nCza3bgZ5/sMYQXIo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Py6ooHAG; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Py6ooHAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775197236; bh=Wd/ig26Ooqk3eYbA7Ljsc6Wa5J1s4tW85iBVUTwDQHs=;
	h=From:Message-ID:From;
	b=Py6ooHAGz18jknl2utaJqYU/QJTcyA3XuzRSg1CfDAWVHJ5AnagcyNVJwnCD1tV3X
	 vWH0H2fRbXv+gVJyWCZhadJVCu2X5PdfVAVnHlN0f6d97MvypeZ1fEdjeXm7WjmWfm
	 zGvYm0XJkdcN+/MsVP6hTmc5Kiwhomisbmig2nlw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 01ADDC0AAF;
	Fri, 03 Apr 2026 08:20:36 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 2/3] Documentation: explain how to find maintainers addresses for security reports
Date: Fri,  3 Apr 2026 08:20:17 +0200
Message-ID: <20260403062018.31080-3-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403062018.31080-1-w@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These days, 80% of the work done by the security team consists in
locating the affected subsystem in a report, running get_maintainers on
it, forwarding the report to these persons and responding to the reporter
with them in Cc. This is a huge and unneeded overhead that we must try to
lower for a better overall efficiency. This patch adds a complete section
explaining how to figure the list of recipients to send the report to.

Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 76 ++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index da7937fd59df..ac97fc78fecd 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -5,8 +5,75 @@ Security bugs
 
 Linux kernel developers take security very seriously.  As such, we'd
 like to know when a security bug is found so that it can be fixed and
-disclosed as quickly as possible.  Please report security bugs to the
-Linux kernel security team.
+disclosed as quickly as possible.
+
+Identifying contacts
+--------------------
+
+The most effective way to report a security bug is to send it directly to the
+affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
+not send it to a public list at this stage, unless you have good reasons to
+consider the issue as being public or trivial to discover (e.g. result of a
+widely available automated vulnerability scanning tool that can be repeated by
+anyone).
+
+If you're sending a report for issues affecting multiple parts in the kernel,
+even if they're fairly similar issues, please send individual messages (think
+that maintainers will not all work on the issues at the same time). The only
+exception is when an issue concerns closely related parts maintained by the
+exact same subset of maintainers, and these parts are expected to be fixed all
+at once by the same commit, then it may be acceptable to report them at once.
+
+One difficulty for most first-time reporters is to figure the right list of
+recipients to send a report to.  In the Linux kernel, all official maintainers
+are trusted, so the consequences of accidentally including the wrong maintainer
+are essentially a bit more noise for that person, i.e. nothing dramatic.  As
+such, a suitable method to figure the list of maintainers (which kernel
+security officers use) is to rely on the get_maintainers.pl script, tuned to
+only report maintainers.  This script, when passed a file name, will look for
+its path in the MAINTAINERS file to figure a hierarchical list of relevant
+maintainers.  Calling it a first time with the finest level of filtering will
+most of the time return a short list of this specific file's maintainers::
+
+  $ ./scripts/get_maintainer.pl --no-l --no-r --pattern-depth 1 \
+    drivers/example.c
+  Developer One <dev1@example.com> (maintainer:example driver)
+  Developer Two <dev2@example.org> (maintainer:example driver)
+
+These two maintainers should then receive the message.  If the command does not
+return anything, it means the affected file is part of a wider subsystem, so we
+should be less specific::
+
+  $ ./scripts/get_maintainer.pl --no-l --no-r drivers/example.c
+  Developer One <dev1@example.com> (maintainer:example subsystem)
+  Developer Two <dev2@example.org> (maintainer:example subsystem)
+  Developer Three <dev3@example.com> (maintainer:example subsystem [GENERAL])
+  Developer Four <dev4@example.org> (maintainer:example subsystem [GENERAL])
+
+Here, picking the first, most specific ones, is sufficient.  When the list is
+long, it is possible to produce a comma-delimited e-mail address list on a
+single line suitable for use in the To: field of a mailer like this::
+
+  $ ./scripts/get_maintainer.pl --no-tree --no-l --no-r --no-n --m \
+    --no-git-fallback --no-substatus --no-rolestats --no-multiline \
+    --pattern-depth 1 drivers/example.c
+  dev1@example.com, dev2@example.org
+
+or this for the wider list::
+
+  $ ./scripts/get_maintainer.pl --no-tree --no-l --no-r --no-n --m \
+    --no-git-fallback --no-substatus --no-rolestats --no-multiline \
+    drivers/example.c
+  dev1@example.com, dev2@example.org, dev3@example.com, dev4@example.org
+
+If at this point you're still facing difficulties spotting the right
+maintainers, **and only in this case**, it's possible to send your report to
+the Linux kernel security team only.  Your message will be triaged, and you
+will receive instructions about whom to contact, if needed.  Your message may
+equally be forwarded as-is to the relevant maintainers.
+
+Sending the report
+------------------
 
 Reports are to be sent over e-mail exclusively.  Please use a working e-mail
 address, preferably the same that you want to appear in ``Reported-by`` tags
@@ -29,6 +96,7 @@ information is helpful.  Any exploit code is very helpful and will not
 be released without consent from the reporter unless it has already been
 made public.
 
+The report must be sent to maintainers, with the security team in ``Cc:``.
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
 who will help verify the bug report and assist developers working on a fix.
@@ -44,7 +112,9 @@ reproduction steps, and follow it with a proposed fix, all in plain text.
 Markdown, HTML and RST formatted reports are particularly frowned upon since
 they're quite hard to read for humans and encourage to use dedicated viewers,
 sometimes online, which by definition is not acceptable for a confidential
-security report.
+security report. Note that some mailers tend to mangle formatting of plain
+text by default, please consult Documentation/process/email-clients.rst for
+more info.
 
 Disclosure and embargoed information
 ------------------------------------
-- 
2.52.0

