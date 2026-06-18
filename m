Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A4D28D8DA;
	Thu, 18 Jun 2026 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790491; cv=none; b=vAwkJMI4QHeoailPS14ypqMRryC4oSraAUZttyTLF4bkBsSxj2NXaRUtBmaT69VL4GXacTyEIxSxssQ0nRRujGu9IvMzN6WB0Bu0jUruptYuQft6vkljdUivuSI/26f2nKrhhDCtPHsSUGBnjZex58cwW9q5p2gUhQaDLkNQ0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790491; c=relaxed/simple;
	bh=4+3YH9+OATahnfK6V4DDGPracyWuXKqHO5B9kHTtB+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6Y3dMg2JuU/YGensM2uJ7cffs3ZuxXv99UJiz2mCBq9hb9PiJhhl+BdMP9ocn/4z92j3817fyNOHYJ7v6ElU3Qxf2nFLm8ae3491mCkS8sEssI3jETmVcJs5X/cHA50LrklwKbVQgm8PjcYlwFplniGmNBIBe8fjDtQpXz0t/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hDBPkiAL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hDBPkiAL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C3516F8;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
Received: from [10.1.25.219] (XHFQ2J9959-3.cambridge.arm.com [10.1.25.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96A63F915;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781790488; bh=4+3YH9+OATahnfK6V4DDGPracyWuXKqHO5B9kHTtB+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDBPkiAL2u8VTbYCHCj8Av31c5gef+OAcJThQqRjNlf20cUZNt5BoVAu5U09JiYRP
	 q2TDscpDjuJODPCb0KxbMEttDvPKMyn5gHiQSi6xN+ZZlRcdvnm6Qr/yJJLwh+Uv6w
	 neXc2gCyt2w7AESd32PfSu+02EtHqxsUFsqDUaRI=
Message-ID: <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Date: Thu, 18 Jun 2026 14:48:03 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, anshuman.khandual@arm.com,
 kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
 will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2026 05:44, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.

Does standard KASAN with HW_TAGS really detect double-free? How does it do that?
I could imagine it testing the tags of memory being freed to see if they are set
to the poison tag, but that would lead to false positives for the GFP_SKIP_KASAN
case, surely?

If I'm right, then the only downgrade this new mode causes is that if
freed-but-not-yet-reallocated memory is accessed via it's dangling pointer, then
that bad access is not detected. I think that would be benign in all the cases I
can think of, so while it would be a problem for a debugging use case, it would
unlikely be a problem for security enforcement?

Thanks,
Ryan


> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 

