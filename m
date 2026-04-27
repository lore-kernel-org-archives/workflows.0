Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C83BED30;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294817; cv=none; b=NOsd+ep1zn+UVUlEe6QWPujEta6PqBGeyX9A3M2Cop5DMxkzrCUmVYmD9iAcwtCo9VwerNCOLtuzon5VfLJCiZpZtXiaseIVbmMwMvw6+1fLMMX8WdOF4rBSP+nBnXYOO5TQxiBeGWCxYXNfUfQQ2a0UFlDKpol2BacYpQ1N+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294817; c=relaxed/simple;
	bh=8uNsWXd48y2d3zF795/5fA+wmbyhrDh/2zHCjgxewvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y28NVtM7hGJL2Gn4sUq+gORkIkVbkU/47cwwj30BGIAlC4BsSLduqtuL3AjsCGDGLwAEbHPFtCb704rENTjXqYt7JDIP4JODyaBFGV2PFpjThe6eUKMvdxeLost1VXFwKSmlACMS7YsFmwIxNdQ8YSFSIeHSZOKYjR6wLz98BzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPrHVwDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPrHVwDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1DBC19425;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=8uNsWXd48y2d3zF795/5fA+wmbyhrDh/2zHCjgxewvY=;
	h=From:To:Cc:Subject:Date:From;
	b=hPrHVwDJukihnGevCo0iVj0JaS3sD9EvuDLl1hdSM6qbgE4D56wpvoQvuxJqkxNVc
	 F1eXyCU19gvUk3NxbtxwUfFATvdVwyy1Pn+dxqUwcFgv3vgd5cfH2CbkgmuiaTDI+Q
	 6j7U91ZnlRrcAY+gTx3HGcb4T8+r3j6ZIWK7Ry8fIkpjI2deFJZAGzzaeyv7BGfAGb
	 9cjVwx7IC456XXau2Vi3WCyhoinAMsxENU18UFX38aovgzsgazmkftmN8coEz3sd+p
	 Zw9f8Bd3JIN+8mHUMysmFcKhv60vLpQzfgIpaudNOYsnpBtz9Owx1QODga3CtGpo1q
	 oV3GgpB0rQezA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx1A-1wNM;
	Mon, 27 Apr 2026 15:00:15 +0200
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
Subject: [PATCH v3 00/12] Auto-generate maintainer profile entries
Date: Mon, 27 Apr 2026 15:00:00 +0200
Message-ID: <cover.1777294623.git.mchehab+huawei@kernel.org>
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
header.

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


Mauro Carvalho Chehab (12):
  MAINTAINERS: add an entry for media maintainers profile
  MAINTAINERS: add maintainer-tip.rst to X86
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
 MAINTAINERS                                   |   2 +
 5 files changed, 152 insertions(+), 54 deletions(-)

-- 
2.53.0

