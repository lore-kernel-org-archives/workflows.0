Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93754355F54;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176959; cv=none; b=QPZsyAcQp0GWA4YOGDpcjTf5WkDmXbOiyWr5aO0h9pEp2f2VqK16Z2/+Bqn33fh2TMW/IPhskbtcC2QittGI4h9jOQ5mEoLoQ5A6laFXJKaYPRkseyhce06HfYjJAUee39FD5jC1FaxnXDoXQPKjtlT5axNCtRoTJ1t3gHctp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176959; c=relaxed/simple;
	bh=Q37AUFFWTils7bZ37skEl+Z0KEumAbKiDlGGPvgg1rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UqmRwUL3yezKBjR9mFIWvMSk5ntCbxrbyXnwvHp+n9JEFrmHeb0abmsNOX0gAxzyOj4kVmzOJcKKgi1JX7XgmeIRVTZ07Gio9LZdp+2Gtm4OBPBJTVrQkw3Brdogam41z3ohC0/bLmu+RWj8ygjWfrNxmKb1ae1hnLBIYc7KizA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhP25WiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhP25WiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB4C19425;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=Q37AUFFWTils7bZ37skEl+Z0KEumAbKiDlGGPvgg1rU=;
	h=From:To:Cc:Subject:Date:From;
	b=JhP25WiPt9NmEuCKQqPRQVKvMhoCcERpHk8I/R3rO7z6IBni6WStoSNkTZ5CqdqTN
	 cqjZPT8hNW4i0NkOToOuh3N359rqMi0jPufPNENeQUzvttBtl1wUtAkARATaq+9L6S
	 2UF85/QxjcxGGekPN1udtw94MZK78R28Wtzvk0f7BYMl27IIvbj3L+oVpgGAEQ0o+Z
	 Sb8iWQfFoqGwBAQ2JxyE2bIcULny9v56815VgZ9PZTSsyLo1UvoIwK1hkGhzJjudLf
	 YCgR4zMcpGfeUhf1P8Iqqdj3Tvz8AnwHgr+LQLkYWSOnSuyPswbla3klttdc9m/gHs
	 bwNk1Y0nWoQhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oLK-0aJT;
	Tue, 14 Apr 2026 16:29:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH RFC 0/4] Auto-generate maintainer profile entries
Date: Tue, 14 Apr 2026 16:29:03 +0200
Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Dan/Jon,

This small patch series change the way maintainer entry profile links
are added to the documentation. Instead of having an entry for
each of them at an ReST file, get them from MAINTAINERS content.

That should likely make easier to maintain, as there will be a single
point to place all such profiles.

I made this as an RFC. The goal is mostly to be a start of discussions
about how this is implemented.

Also, it should be noticed that  I'm not incorporating the diff
content from Dan's sugggestion, as it was just an e-mail reply without
a proper patch title/description/SoB.

Some points on this RFC:

1. some P: entries are links to web pages. The current approach
   ignores them;

2. the current logic doesn't use glob. So, if one would add an
   entry like:

	P: Documentation/foo/profiles-*.rst

   it will generate an entry like "../foo/profiles-*".

   This probably works, as toc trees accept glob.

3. entries are placed at the order they occur at MAINTAINERS
   file (but duplication is properly handled);

4. as Randy mentioned, if an entry there is inside another TOC
   using numeration, those entries will have numeration as well;

5. the approach I took on patch 1 was a little bit lazy, as it
   ends processing MAINTAINERS two times, and there are some code
   duplication on different classes to handle path. I opted to do
   this way to minimize the differences, but it makes sense to 
   clean the code later on newer versions of this series or after
   applying it;

6. patches 2 and 3 can be applied independently of this approach.
   They just add two missing "P:" entries to MAINTAINERS.

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/

Mauro Carvalho Chehab (4):
  docs: maintainers_include: auto-generate maintainer profile TOC
  MAINTAINERS: add an entry for media maintainers profile
  MAINTAINERS: add maintainer-tip.rst to X86
  docs: auto-generate maintainer entry profile links

 .../maintainer/maintainer-entry-profile.rst   | 17 +---
 .../process/maintainer-handbooks.rst          | 10 +-
 Documentation/sphinx/maintainers_include.py   | 93 +++++++++++++++----
 MAINTAINERS                                   |  2 +
 4 files changed, 81 insertions(+), 41 deletions(-)

-- 
2.52.0

