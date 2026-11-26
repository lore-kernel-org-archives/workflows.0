Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713575;
	b=MTT+0OZk+Bog1AC7bssCwYqqDV+EuGbDcRteKqYUe/YfKO/4lMc6R9Xzd/3UhBV63VMA
	 t52HmnHJOaAAUhWnX12Vo+JrpUIUjWKUSMu+5bzXQtVLUZBhIGS19pKK6Hh6WUQhz6b+b
	 Bo5i90maONvGwGbJ9wd0He2hyPcb/xOygQ5B2KOAdsieOsm8Jsn77Ki8e1aXXZRFWDrPB
	 0fKWB+g7/103e14CNQRAof5LUrwJuBMZDbJcHZ8KEnSwDyZFeUvCXjrI5mRpR9K16dMo6
	 9QOn7Dz2RFZkKUNl5sA4yZ3OPhruIYe+Xng0R3KH+XucJs8Qpv6ZI1b+nw53b4nAkOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713575;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6QABNub+dTZARCfJQEJTHzpf5kF7y3WNlSVigusNo7U=;
	b=2E2XaFg3CncpKcg3LKhZ150iGo7sWoO9xwWVHTJAGOFEOWks+pmBR/OXBHjM3VBJcwv9
	 RJ1qZWxHHsOPevaAh1Ct+B5TVBkHmz7tV3gq2yzS32Oc6drRIk0XJNTT9vi+eXDG/R2hM
	 CntDyyOSN2YkE1LMI5lU5tK3lggCHyMsjcQqa8boAoPQXWdKn3IAYFeHUem7FwXxgewkz
	 Qtjceq51TI3a1+c7myPVig/EYabxVMLmEk8rO33NDPJzyd9a4XJD62ntXSVmwh8voCGWq
	 l6H7vqKIvgoy39f5tbygVOdLYUUJZXgXEDcIzUQGbaHJV+qRRQW9nWrJCH80AQAVj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=memaq40b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAE606A687;
	Thu, 26 Nov 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=memaq40b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA61F000CF;
	Thu, 26 Nov 2026 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713575;
	bh=6QABNub+dTZARCfJQEJTHzpf5kF7y3WNlSVigusNo7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=memaq40bEXyu5rEoZF1ahkpSYArYKF0JZtOCgCSN0GqPPDEObrwd9wXxk9taylxzn
	 n1pU+ownUT+YnpTkPZ3bNhlEhNm4HKN4nUbZ9PdZYJTsjA7R3hd0W0hPMUerLUPPE6
	 ACET55cLiBpdp5yU5WxmJ275wKeKP35ntUC7z2YFHHqx407Jae35JJAhXFoVulZHBI
	 yb4Fr1XGUXZDtsdSPFdoJLI3paRJwKIIsZbdI/7oU1tyaFdgQvooH+ZDt+K6YkQgNs
	 JBGJGjhIh9gp9Tlwnqcwg2vKor2bCO363Ad9VTU9FTJD7Rk0LRd3Ug6jfSrf9NAPp1
	 dL7EAUZzi3g0w==
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
Subject: [PATCH 2/2] docs: security-bugs: ask AI-assisted fixes for their cover letter
Date: Thu, 26 Nov 2026 12:19:25 -0500
Message-ID: <20261126171926.2766137-3-sashal@kernel.org>
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

coding-assistants.rst asks for a cover letter with the evidence behind
every patch an AI assistant prepares. A fix for a security bug needs
that evidence as much as any other fix, so name the cover letter in the
summary of that procedure and in the list of recipients.

The cover letter goes where the patch goes, which usually includes a
public list, while the reproducer goes to the maintainers only. Say
that the reproducer and the steps to trigger the problem stay out of
the cover letter, which only mentions that a reproducer exists.

"Length" asks for short reports. With the complete output in the cover
letter the report has no reason to carry it.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/security-bugs.rst | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index c7dfecc87764c..0423a814c6a1e 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -233,8 +233,8 @@ At the very least, when using an AI assistant to find and report bugs, make the
 assistant read this file and threat-model.rst before proceeding, and have it
 follow the procedure described in coding-assistants.rst: work on an up-to-date
 mainline tree and note the commit ID, verify the bug is real, write a fix,
-build it warning-free and checkpatch-clean, commit it with a Fixes tag, and
-identify the maintainers with get_maintainer.pl.
+build it warning-free and checkpatch-clean, commit it with a Fixes tag,
+identify the maintainers with get_maintainer.pl, and write the cover letter.
 
 On top of that procedure, the AI assistant **MUST**:
 
@@ -244,10 +244,15 @@ On top of that procedure, the AI assistant **MUST**:
    the description of the problem, the reproducer or its status, and the
    triggering conditions.
 2. Start the report with a temporary section listing the recipients' addresses
-   (maintainers+list for the patch, maintainers only for the report and
-   reproducer), and with instructions reminding the reporter to check that
-   their email client is properly setup (see email-clients.rst), and leave it
-   to the reporter to remove that temporary section.
+   (maintainers+list for the patch and its cover letter, maintainers only for
+   the report and reproducer), and with instructions reminding the reporter to
+   check that their email client is properly setup (see email-clients.rst), and
+   leave it to the reporter to remove that temporary section.
+3. Keep the reproducer, and the steps that trigger the problem, out of the
+   cover letter that coding-assistants.rst asks for. The cover letter goes
+   where the patch goes, which usually includes a public list, so it only says
+   that a reproducer exists. With the complete output in the cover letter, the
+   report itself can stay short.
 
 A more detailed process is covered at https://github.com/masoncl/kres.git.
 
-- 
2.53.0

