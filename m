Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF5728504D;
	Mon, 22 Jun 2026 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782102123; cv=none; b=SZLppVIZyWJhPNHorI6OLf+mdRtvAje7k7iAcu8RmyIdso5zYxY0BVDGY+kjUoLdazr2DMtpAJKGvBOb66Op4ghnjy/4WZUHDOGLDpBnphX95yDhkdK60jlKeQU6NPIxLW17vYW3ZpRKBCNDgrnEml/6vOjNqkrgqt20wlkzQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782102123; c=relaxed/simple;
	bh=MeoUdRHU+a8GHZTXWy3AhV6g6+tAIm18618t9DJUnCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dL4z9Khe+MpXG21aTpdHgRhGNYhGg6I4N4Apk+evxGPCBiZ3z1SuGORVwY+OmRYTUWUmo3nottpFmWvAhI+CCDNL5rvIl+7XkY3OS6GxDAmAiK4P7QQ5+piyXomnXiiLi8e2tFIUHue/GFdCB2RofU+u2XFNj/cbeQXB7WoUx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IbRtbVJC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IbRtbVJC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93661BF3;
	Sun, 21 Jun 2026 21:21:49 -0700 (PDT)
Received: from [10.164.148.39] (unknown [10.164.148.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E65393F632;
	Sun, 21 Jun 2026 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782102114; bh=MeoUdRHU+a8GHZTXWy3AhV6g6+tAIm18618t9DJUnCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbRtbVJCoc0dwm5V7cKHFiVgZ9iYADrT13EoROHmpvgAovU/LJpHhIzFFEEl6wvdM
	 sqhoZFbiyg75byqaF55UYJsFFAzQzT3bHs4+SK65T1LwpyBS8gpIjggXYF5AnxBoTM
	 TidnUlP4peozlYOQ8q/TqZUfm8jNfOWpCBAjjo5M=
Message-ID: <69b316bf-7163-4040-8682-e3d200b7d7c6@arm.com>
Date: Mon, 22 Jun 2026 09:51:26 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Isaac Manjarres <isaacmanjarres@google.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <aiyhb2XwMMJE3st7@google.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aiyhb2XwMMJE3st7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/06/26 5:46 am, Isaac Manjarres wrote:
> On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects. This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>>
>> Now, when a memory object will be freed, it will retain the random tag it
>> had at allocation time. This compromises on catching UAF bugs, till the
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catching
>> "double-free" will be the compromise for reduced KASAN overhead.
>>
>> This is an RFC because we are not clear about the performance benefit.
>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.43.0
> 
> I tested out this series on one of our devices that has MTE support,
> and didn't see any functional issues.

Thanks for testing Isaac! Do you have the bandwidth to carry out some
performance tests? We want to see whether this patchset gets perf boost
on some HW.

> 
> One thing I did notice though, and it's independent of this patch, is
> that the vmalloc_oob is failing, but that happens even if these patches
> aren't present.
> 
> Thanks,
> Isaac

