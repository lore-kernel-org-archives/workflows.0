Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A5800;
	Sun, 19 Apr 2026 00:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557164; cv=none; b=LqGUyVmWSTDbQs3r1LIEUXFqNoFC00/RL2Y01nWPQlgyYeOpNBUWnMe6pdzuE5p/pBAJTUrY/hRq0lxQUm4r7aQJyNB2GMyo4pRzYM3eLNmt8EG9zI5FiPEzoDpjb4t8biD39PW1yPeTSCB6uLvo64PEdU6EapdHWpEKcret8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557164; c=relaxed/simple;
	bh=dW8QOQ2zL8gb56W2lwXiKSDYspJ6BWWTrXkCLDKANa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTwBBWZOkNsnoNwFc2nhrjVBoqpoEffw07UWd5KLI5mPYoYCnCdfk/914XHLnPv/HXKhnV/9nKuqv631n7vTnEG7mUJJ2TjMgvmgQRAMzwo85SpJkA69k619FuURUGZiHJeilzq3o/34XcdXYms79I/RdCQ4KssXcUXvJOeSmTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ePZutsbd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ePZutsbd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gE+sMINk4fwtiWsWkLkpcvPmLPsCq4Z9tTKJM5FkgXw=; b=ePZutsbd0uGSSB15YzEZNeTcMf
	MR69e4mOxvmPLtvpNLkmoDCPZxoEFgoKgH6c7IjZoOydi9X0EP2pVAZQCIif8u4AW/9ggpeNSoihR
	K0mpObwS4Wak4d7Y+j+h+NZYm/twrBeMyafTHSqTx6emZguRvbZgsi7w/KIdplt61fauVkJEE2f/u
	aCNb8gNJjP+97Mk738sC4jGxttYwWMARcSaCLlILWH7mircsspdJyV5GmopVqEwKXZ559GGaOKRko
	ZTVN+7PiNGXXEwiQn4FHkmCreqsTK7lpf0EUt0DJ66tLjtXmX86Da7LVhYMTGIOXaNGWUFekdv17B
	m6vNPQ5w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFfg-00000005M3y-2rpf;
	Sun, 19 Apr 2026 00:05:59 +0000
Message-ID: <9bcb8053-2eb6-4327-ae3f-2a23321c4c3e@infradead.org>
Date: Sat, 18 Apr 2026 17:05:56 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Auto-generate maintainer profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>,
 Dan Williams <djbw@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
> 
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
> 
> The output is a per-subsystem sorted (*) series of links shown as a
> list like this:
> 
>     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
>     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
>     - Arm/Tesla Fsd Soc Support
>     ...
>     - Xfs Filesystem
> 
> Please notice that the series is doing one logical change per patch.
> I could have merged some changes altogether, but I opted doing it
> in small steps to help reviews. If you prefer, feel free to merge
> maintainers_include changes on merge.
> 
> There is one interesting side effect of this series: there is no
> need to add rst files containing profiles inside a TOC tree: Just
> creating the file anywhere inside Documentation and adding a P entry
> is enough. Adding them to a TOC won't hurt.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> 
> (*) At the end, I opted to use sorted(), just to ensure it, even
>     knowing that MAINTAINER entries are supposed to be sorted, as
>     the cost of sorting ~20 already-sorted entries is negligible.
> 
> ---
> 
> v2:
>   - I placed the to MAINTAINERS changes at the beginning.
>   - fix a bug when O=DOCS is used;
>   - proper handle glob "P" entries (just in case, no profiles use it ATM);
>   - when SPHINXDIRS=process, instead of producing warnings, point to
>     entries at https://docs.kernel.org;
>   - MAINTAINERS parsing now happens just once;
>   - The output won't be numered for entries inside numered TOC trees;
>   - TOC tree is now hidden;
>   - instead of display a TOC tree, it shows a list of profiles,
>     ordered and named after file system name taken from MAINTAINERS file;
>   - At the output list, both https and file profiles are shown the same
>     way.
> 
> Mauro Carvalho Chehab (11):
>   MAINTAINERS: add an entry for media maintainers profile
>   MAINTAINERS: add maintainer-tip.rst to X86
>   docs: maintainers_include: auto-generate maintainer profile TOC
>   docs: auto-generate maintainer entry profile links
>   docs: maintainers_include: use a better title for profiles
>   docs: maintainers_include: add external profile URLs
>   docs: maintainers_include: preserve names for files under process/
>   docs: maintainers_include: Only show main entry for profiles
>   docs: maintainers_include: improve its output
>   docs: maintainers_include: fix support for O=dir
>   docs: maintainers_include: parse MAINTAINERS just once
> 
>  .../maintainer/maintainer-entry-profile.rst   |  24 +--
>  .../process/maintainer-handbooks.rst          |  17 +-
>  Documentation/sphinx/maintainers_include.py   | 161 +++++++++++++++---
>  MAINTAINERS                                   |   2 +
>  4 files changed, 150 insertions(+), 54 deletions(-)
> 

Just a note, not asking for a change or fix:

AFAICT, all P: entries are now listed nicely except for:

P:	rust/pin-init/CONTRIBUTING.md

so for the series:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
