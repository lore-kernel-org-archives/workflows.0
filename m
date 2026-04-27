Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC73D1719;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299755; cv=none; b=kSp89kh1KpKo8knM3v55hPveDYXTN1Zy7yXFi39J4Kcl1WyiYqObGF+9H/Aq3MbhmGnEUU/WgvZh7+8e1IpKyKddFma2oSHEJciBwTtKoHyxoY3QT+qJS1ud737sg/1NSqedhZikB4whLdDsyyDt+p+Y+xgyIUdf+dXFs7KrQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299755; c=relaxed/simple;
	bh=yvJZ1GDHURo4wpDVebQJO6GRAN8RUuGUnTVcK5HT+04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ec/UgK74SSvJCb2J8KZxriFu9BOP2dljhqU0aRfcdGamzSWR2cneGMI1SEhEU+VVuDpRTINDwMQ1d6hjvWx7WA+/qMqg6OfKbd3Kmmu4PNdUACtnQMNCglCb2siQACt8uBUSvyRiL2A6COsq9DSeOsnCR2AWsyZ1JRLt5sv5rKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoUzcRWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoUzcRWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A15C2BCB5;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=yvJZ1GDHURo4wpDVebQJO6GRAN8RUuGUnTVcK5HT+04=;
	h=From:To:Cc:Subject:Date:From;
	b=QoUzcRWAu91OGOQdrvGaOSZMZKrY4p40ZHxF870Reazad4KPw3aZA7uqDLvugWbhQ
	 vvcUtI0dzd39917CGlUcQzRb9cyjQwXxBjVGqmFSKPSGKRVxLEGvEB7I6gSMOnR6Fq
	 dqBMRhL9UN911iuUB7500aRNveONyEmYhZe5GK3wx5hwxMBip0UcKUwGQ1NvampzLW
	 o+wclDVkHDbHODKvR6hvPvy+XyCF09DgrxJG6NIih01/qBeUNNCmguVwjQI1rQ5SpA
	 LJyI5ZsyMgR7bJipg77H/NyMQQWJq5Sr1ZHbZKVu3/rmtzYbvcyrK1XwfVEJY2h4vR
	 HETt0ClpAcpIw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8Os-1uPW;
	Mon, 27 Apr 2026 16:22:33 +0200
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
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH v4 00/10] Auto-generate maintainer profile entries
Date: Mon, 27 Apr 2026 16:22:18 +0200
Message-ID: <cover.1777295258.git.mchehab+huawei@kernel.org>
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

Hi Jon,

This is basically the same patch series I sent during the merge
window, rebased on the top of post 7.1-rc1 docs-next branch.
It is tested both with and without O=DOCS.

It contains just one extra trivial patch adding a missing SPDX
header, and, on v4, I dropped two patches touching MAINTAINERS,
as those aren't needed anymore.

This patch series change the way maintainer entry profile links
are added to the documentation. Instead of having an entry for
each of them at an ReST file, get them from MAINTAINERS content.

That should likely make easier to maintain, as there will be a single
point to place all such profiles.

The output is a per-subsystem sorted (*) series of links shown as a
list like this:

    - Arm And Arm64 Soc Sub-Architectures (Common Parts)
    - Arm/Samsung S3C, S5P And Exynos Arm Architectures
    - Arm/Tesla Fsd Soc Support
    ...
    - Xfs Filesystem

Please notice that the series is doing one logical change per patch.
I could have merged some changes altogether, but I opted doing it
in small steps to help reviews. If you prefer, feel free to merge
maintainers_include changes on merge.

There is one interesting side effect of this series: there is no
need to add rst files containing profiles inside a TOC tree: Just
creating the file anywhere inside Documentation and adding a P entry
is enough. Adding them to a TOC won't hurt.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/

(*) At the end, I opted to use sorted(), just to ensure it, even
    knowing that MAINTAINER entries are supposed to be sorted, as
    the cost of sorting ~20 already-sorted entries is negligible.

---

v4:
 - Dropped changes to MAINTAINERS, as other patches already
   updated media and tip entries.

v3:
 - Added SPDX entry to process/maintainers.rst file;
 - rebased after 7.1-rc1 release.

v2:
  - I placed the to MAINTAINERS changes at the beginning.
  - fix a bug when O=DOCS is used;
  - proper handle glob "P" entries (just in case, no profiles use it ATM);
  - when SPHINXDIRS=process, instead of producing warnings, point to
    entries at https://docs.kernel.org;
  - MAINTAINERS parsing now happens just once;
  - The output won't be numered for entries inside numered TOC trees;
  - TOC tree is now hidden;
  - instead of display a TOC tree, it shows a list of profiles,
    ordered and named after file system name taken from MAINTAINERS file;
  - At the output list, both https and file profiles are shown the same
    way.


Mauro Carvalho Chehab (10):
  docs: maintainers: add SPDX license to the file
  docs: maintainers_include: auto-generate maintainer profile TOC
  docs: auto-generate maintainer entry profile links
  docs: maintainers_include: use a better title for profiles
  docs: maintainers_include: add external profile URLs
  docs: maintainers_include: preserve names for files under process/
  docs: maintainers_include: Only show main entry for profiles
  docs: maintainers_include: improve its output
  docs: maintainers_include: fix support for O=dir
  docs: maintainers_include: parse MAINTAINERS just once

 .../maintainer/maintainer-entry-profile.rst   |  24 +--
 .../process/maintainer-handbooks.rst          |  17 +-
 Documentation/process/maintainers.rst         |   2 +
 Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
 4 files changed, 150 insertions(+), 54 deletions(-)

-- 
2.53.0

