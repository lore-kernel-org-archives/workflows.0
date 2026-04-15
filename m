Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85A388E56;
	Wed, 15 Apr 2026 20:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285730; cv=none; b=jtjgeOOF9HQgkt1sxWHEAkvQ1XhZW59fb/sHdN8r0EodCOgBG1Gj9hhiaqark1FqwRyzohkpLw2cxdvZJ/7i0eB6g1eGs53Bcu98ddkQxLMvXFfeHbmvkjWugm5BVYyMtG4cYcD8V1XoZeZG4GF19NkmvD54q/Ph3kYzwNB0sOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285730; c=relaxed/simple;
	bh=Xzd2CUJJ8z3EoXKcsDKLmkr2vCR7Zi96So2JehYv0TI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hLKkj1epRXH+hcXxXpa0XN1uhoeVZ3QOgzLuVcBPVoh2G/raxECXCzdaMnTwLjUhq8DCMhNZy2Hx/CaBV+d4cK5cVfYKW3wf9DozSel1qlfJx6qYZ6arBeoJ+Tv1XGs+SIHAmVui4IAOCxNCYRUon1hqLTIc0Te+yWqeXi8dIRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wzXlCkhD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wzXlCkhD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1aI+Ng4erWXxFs8ZUX3dbkCgT4drnJQF8UdC69GC4XY=; b=wzXlCkhDyKgXfW98jVR6l3CFTK
	yZYX2n2+J73Qf67dI6tTBkcSDeDqES+SjijBg373d/NQPeJ2u9XE2XH6SoofOeFxNtTyNoCh8V23W
	7mXVIR8iK3ccKk33FPs97X6N6PU7JfA4R5Gsl7jjEBktMBMevLysOS1AZ+EOKnN2gBDfPiMEERuOU
	8FimRqe0zj0bewfrfP3YNQ78I0z0qu1uJ1D2FxSXsxnRyken2wJb0zh+4+koPvvx0LDfEa532eDNd
	grCb8rKbdFir1bOIJ8DQefISMbDd8LQDWMjNlmLLC7PtRScAXEsj7ZzLSZWj3RvfEdhD//8nDjcVT
	2jpxYHlQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD731-00000001az3-2X16;
	Wed, 15 Apr 2026 20:41:30 +0000
Message-ID: <88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org>
Date: Wed, 15 Apr 2026 13:41:16 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/8] Auto-generate maintainer profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <djbw@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Content-Language: en-US
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Thanks for tackling this issue.

On 4/15/26 1:52 AM, Mauro Carvalho Chehab wrote:
> Date: Tue, 14 Apr 2026 16:29:03 +0200
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> To: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Dan Williams <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>
> Message-ID: <cover.1776176108.git.mchehab+huawei@kernel.org>
> 
> Hi Dan/Jon,
> 
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
> 
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
> 
> On this version, I added Dan's text to patch 4.
> 
> I also added a couple of other patches to improve its output. While
> I could have them merged at the first patch, I opted to make them
> separate, as, in case of problems or needed changes, it would be
> easier to revert or modify the corresponding logic. Also, it should
> be better to review, in case one wants some changes there.
> 
> The main changes against RFC are:
> 
> - now, the TOC will be presented with 1 depth identation level,
>   meaning that it would look like a list;
> - for files outside Documentation/process, it will use the name of
>   the subsystem with title capitalization for the name of the
>   profile entry;
> - the logic also parses and produces a list of profiles that are
>   maintained elsewhere, picking its http/https link;
> - entries are now better sorted: first by subsystem name, then
>   by its name.
> 
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> 
> Mauro Carvalho Chehab (8):
>   docs: maintainers_include: auto-generate maintainer profile TOC
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86
>   docs: auto-generate maintainer entry profile links
>   docs: maintainers_include: use a better title for profiles
>   docs: maintainers_include: add external profile URLs
>   docs: maintainers_include: preserve names for files under process/
>   docs: maintainers_include: Only show main entry for profiles
> 
>  .../maintainer/maintainer-entry-profile.rst   |  24 +---
>  .../process/maintainer-handbooks.rst          |  17 ++-
>  Documentation/sphinx/maintainers_include.py   | 131 +++++++++++++++---
>  MAINTAINERS                                   |   2 +
>  4 files changed, 128 insertions(+), 46 deletions(-)

When building htmldocs with O=DOCS, I get a bunch of warnings.
I tested against today's linux-next tree.

The 'make O=DOCS htmldocs' warnings are (subset of all warnings):

linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-kvm-x86' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/filesystems/xfs/xfs-maintainer-entry-profile' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-soc-clean-dts' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-netdev' [toc.not_readable]
linux-next/MAINTAINERS:38: WARNING: toctree contains reference to nonexisting document 'DOCS/Documentation/process/maintainer-tip' [toc.not_readable]

linux-next/Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-kvm-x86.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-netdev.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-soc-clean-dts.rst: WARNING: document isn't included in any toctree [toc.not_included]
linux-next/Documentation/process/maintainer-tip.rst: WARNING: document isn't included in any toctree [toc.not_included]

linux-next/MAINTAINERS:1: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc' [ref.doc]
linux-next/MAINTAINERS:2: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
linux-next/MAINTAINERS:3: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-soc-clean-dts' [ref.doc]
linux-next/MAINTAINERS:5: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]
linux-next/MAINTAINERS:6: WARNING: unknown document: '../../DOCS/Documentation/process/maintainer-tip' [ref.doc]


-- 
~Randy

