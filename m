Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414817D6;
	Wed, 15 Apr 2026 00:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213457; cv=none; b=tx8QqxPU+J5mCwS7oA1a1tVPqQUygn/62wOaGjMJHSx89XsN7naCiu/e2jphgnKHJTF+3fMtJ73EQz2M5CvvLKF3fdPfUnw0nNhj+EVT6eZ2ZRjwL+nOlwc/Ht7s2lAWZ3W8jOY3Z1lh0nP0nJt38C3fcT64kRAi+Gv0D6xPxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213457; c=relaxed/simple;
	bh=3PEfrL6fDGxsf2xG0c1EF3bhbqIOdr+weN389Kb+v5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEnWATKMcEGgbrBa9biL7U+hhiG2eBk/0y/uc0PRBPGL/TV7f5cFqPNS/Js6EBAoMUhtvKL1qRBj0QNKp6RQsxLCGU7TqG2SyX61hqn4dGKRcdaXxQDvIykNd0559hvjLrDhIZuangA53c1EsIPRs96R67XFzM9EBi/QH9joYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fFiMKite; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fFiMKite"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rUf7HcTAIUntMF56QhgYqveryl7fV/mPk+AH1LyBxgY=; b=fFiMKite9ms0dkBIe0P3dzK+V/
	z8V68ITNPbtM4tTU483ZdRn0BX3ZnMuY9PGyti9kkYLnQJsa9PylnK4GiloQ1xLhch7bZjoz7xfCX
	9VW2LOZZx81ZOSn/JFlAETbqUYTadXyMTvpTUyfLZQ1DHTKiq5uUGKTEybWMRX2YOrT0nIhwrA2To
	8HGzjE0tho43lTbhzFwM4GOMvSduZ2LNQPEk8fFrTZkeLQqQdAtewkjHsLCGRRuzdPNcEnnI/mN4t
	vyvH64TB1dd7tqhB40fYtwKuFsKjHKRYe+DC/tUzrqSYPkFXFNas248QFgXztiKg/sdF+g0n21Mxg
	B5GGBzmg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoG6-00000000Ntv-1oq7;
	Wed, 15 Apr 2026 00:37:34 +0000
Message-ID: <81cf7a52-cfaf-4e2f-9711-a8593ee2843d@infradead.org>
Date: Tue, 14 Apr 2026 17:37:33 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/26 7:29 AM, Mauro Carvalho Chehab wrote:
> While the maintainer's profile for tip is there, it is not
> at X86 maintainer's entry.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 620219e48f98..a85fcae5f56e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28560,6 +28560,7 @@ M:	Ingo Molnar <mingo@redhat.com>
>  M:	Borislav Petkov <bp@alien8.de>
>  M:	Dave Hansen <dave.hansen@linux.intel.com>
>  M:	x86@kernel.org
> +P:	Documentation/process/maintainer-tip.rst
>  R:	"H. Peter Anvin" <hpa@zytor.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained

-- 
~Randy
