Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA433AE1A0;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243149; cv=none; b=uxPltNIirNPQN+P5gdsU0r3+qWwaISTvuEFzNE/RdSICBjsN6KDslCH3t7LSSKVFbOVqm5MktIRiEdDVEnQqVPFrNfDJqMcSsyU/muLtrR30O80mZA0MQ7E88rFCT1VmJl/TT2ZeipKNXmIyBaVsLA+mfSsbqDOChiW1GJNC4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243149; c=relaxed/simple;
	bh=cM6i2dqdYB7bquqYDadO6rTomOEopoC5wEog5eeYeTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vj2eICMLPHBbz9S4PRlxeQTlwO8SfIgf1UcYOROVzpV8n9LngheuMbFVX2fsP5pYguuX2F1B8coKXBRCRLlLXr8VCJ1fEOIiu3qN15mdyB0LUFIkxZuw2UW2tJXKKYZOEZA5DvYYj7OiSAkG8mT0HKLRhf2YwJ/bMvqckZB7aLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YloOutj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YloOutj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900D4C2BCB0;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=cM6i2dqdYB7bquqYDadO6rTomOEopoC5wEog5eeYeTU=;
	h=From:To:Cc:Subject:Date:From;
	b=YloOutj2DFV4uhUrbByc7+kZKdXeSH2DTklHY2SeHSoFDQPLOPlFfZHaOZ6K4/hTT
	 3FupzResoirzc1lZZor7r97Mh2NheYT7Fu5Sf6TXU5wUY3cMeku50MaRkZvcopgLXZ
	 dqjzwqA5h5bcT1HXOcPpn3W6LyHxviUZ5mScNnSPS4lj3kiNLVLrAzpFzHy/EgaNnm
	 +NEKSpCRfYunzsOGWOuU8/5w5Xpn52Z6rd0m7wqJ9DMCvqkJmVZaBI1rvv7Ki6NCbR
	 7IhM1ec6++zdvsSUzGHy3rfIDY0Rosbhx+qGoiKR7hZiNaq3ac1SshBbKzGI55x9h0
	 s7Dj1aM3d0rag==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELvT-29QE;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH 0/8] Auto-generate maintainer profile entries
Date: Wed, 15 Apr 2026 10:52:16 +0200
Message-ID: <cover.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Date: Tue, 14 Apr 2026 16:29:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Dan Williams <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>

Hi Dan/Jon,

This patch series change the way maintainer entry profile links
are added to the documentation. Instead of having an entry for
each of them at an ReST file, get them from MAINTAINERS content.

That should likely make easier to maintain, as there will be a single
point to place all such profiles.

On this version, I added Dan's text to patch 4.

I also added a couple of other patches to improve its output. While
I could have them merged at the first patch, I opted to make them
separate, as, in case of problems or needed changes, it would be
easier to revert or modify the corresponding logic. Also, it should
be better to review, in case one wants some changes there.

The main changes against RFC are:

- now, the TOC will be presented with 1 depth identation level,
  meaning that it would look like a list;
- for files outside Documentation/process, it will use the name of
  the subsystem with title capitalization for the name of the
  profile entry;
- the logic also parses and produces a list of profiles that are
  maintained elsewhere, picking its http/https link;
- entries are now better sorted: first by subsystem name, then
  by its name.

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/

Mauro Carvalho Chehab (8):
  docs: maintainers_include: auto-generate maintainer profile TOC
  MAINTAINERS: add an entry for media maintainers profile
  MAINTAINERS: add maintainer-tip.rst to X86
  docs: auto-generate maintainer entry profile links
  docs: maintainers_include: use a better title for profiles
  docs: maintainers_include: add external profile URLs
  docs: maintainers_include: preserve names for files under process/
  docs: maintainers_include: Only show main entry for profiles

 .../maintainer/maintainer-entry-profile.rst   |  24 +---
 .../process/maintainer-handbooks.rst          |  17 ++-
 Documentation/sphinx/maintainers_include.py   | 131 +++++++++++++++---
 MAINTAINERS                                   |   2 +
 4 files changed, 128 insertions(+), 46 deletions(-)

-- 
2.53.0

