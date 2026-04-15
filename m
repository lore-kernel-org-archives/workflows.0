Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80457083C;
	Wed, 15 Apr 2026 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213302; cv=none; b=gWdfCgfMusQg/kqU+hmHzg5LmCPtOSqJah9SE4WieJ+WVhxOYHttUJqtYtrYl4WjEmym+o+mdp0d9vj8/nVKIutOS52fW6buBZdFeRzZefcMvHDIRDRqnhaOvxIs2cUkGV4CtIP7qsQnlBOyCK4CJFWe0lTN9jy4DToPDLETZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213302; c=relaxed/simple;
	bh=LtjE1dxQrVph8+w0dXWRQhDwV4rKRzwVPh040n4kVl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nut8yIOjTvsFmESsStCYRljceemfMPkkZV6mXx8YBxKaGUtB5q4LFzc8cba9tNbzmQiy/uqpAKNYf7HVy08MlG+AfPi1QKr2JCk78/VEG1o+fp//gpzuF/pKxAdsFHGrG30BAJ3PD2MOgSheyTg7SxsTgH9EgZQnNAWOiJSRC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kPKH5RCc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kPKH5RCc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iI0OFs8oPawoCCKrVVvOeSQbWjzF/DF6/v/WqcYQtko=; b=kPKH5RCcDK5/rSlJgEUedd0EPt
	p/yrWPnHOJf/XRk/eU+idCCz1QPXz2pTRNkbO5Y0bY4BVAu6S+o+dNscKU0rHBBNjMnyfGzgVtYfT
	E/gG6NUm8rZ5Ql/hdouYkHuNWhEZkZjPeWcbn5Com5SyMxNzViJNnf0oVfZEIXvhrt28cvLWOz7dX
	aUV+Y16Um9qE4gJkKlVne0ZUTXFrG9GN8KtCvFE26wr+i9QpYzsMPIHov8Tk0KPYFxUjjpcuzhETx
	tSwFm/DWF4KFBRLl/+qpc/To3Rm9X27YTW78zdP75SBJ4Kt8ojHoHfYmjERmouFZlq0cd9zR8w6Rd
	0s9AeAdg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoDR-00000000NjY-1TFy;
	Wed, 15 Apr 2026 00:34:49 +0000
Message-ID: <0575dd11-d812-4a1c-bf50-4410a38befb7@infradead.org>
Date: Tue, 14 Apr 2026 17:34:48 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] docs: auto-generate maintainer entry profile
 links
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dan Williams <djbw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/26 7:29 AM, Mauro Carvalho Chehab wrote:
> Instead of manually creating a TOC tree for them, use the new
> tag to auto-generate its TOC.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../maintainer/maintainer-entry-profile.rst     | 17 ++---------------
>  Documentation/process/maintainer-handbooks.rst  | 10 +---------
>  2 files changed, 3 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index 6020d188e13d..48ecabd4ce13 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -98,18 +98,5 @@ Existing profiles
>  For now, existing maintainer profiles are listed here; we will likely want
>  to do something different in the near future.
>  
> -.. toctree::
> -   :maxdepth: 1
> -
> -   ../doc-guide/maintainer-profile
> -   ../nvdimm/maintainer-entry-profile
> -   ../arch/riscv/patch-acceptance
> -   ../process/maintainer-soc
> -   ../process/maintainer-soc-clean-dts
> -   ../driver-api/media/maintainer-entry-profile
> -   ../process/maintainer-netdev
> -   ../driver-api/vfio-pci-device-specific-driver-acceptance
> -   ../nvme/feature-and-quirk-policy
> -   ../filesystems/nfs/nfsd-maintainer-entry-profile
> -   ../filesystems/xfs/xfs-maintainer-entry-profile
> -   ../mm/damon/maintainer-profile
> +See Documentation/process/maintainer-handbooks.rst for subsystem-specific
> +profiles.
> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
> index 3d72ad25fc6a..d3d74c719018 100644
> --- a/Documentation/process/maintainer-handbooks.rst
> +++ b/Documentation/process/maintainer-handbooks.rst
> @@ -9,12 +9,4 @@ which is supplementary to the general development process handbook
>  
>  Contents:
>  
> -.. toctree::
> -   :numbered:
> -   :maxdepth: 2
> -
> -   maintainer-netdev
> -   maintainer-soc
> -   maintainer-soc-clean-dts
> -   maintainer-tip
> -   maintainer-kvm-x86
> +.. maintainers-profile-toc::

It appears that the maintainer profile entries should be listed
here, following "Contents:". Is that correct?
I see nothing following "Contents:" except for the page footer.


-- 
~Randy

