Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527A34AEEF;
	Fri, 19 Jun 2026 04:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844400; cv=none; b=igB7G3/wGct9S3jqfMKFJMGD6N0O6BX80rvIk7AkfWj4JfxKj74M6KNjnltKG2mEsxV2rI+fGIh4NTDtwNZbO+qFRXbFYHQo+x0KcN77P8GB8pPTedJuYmxlb9WW2+qBzhLaNFChk34E5fe/qutdB2ZHiK8j16iD5CgMrvsWdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844400; c=relaxed/simple;
	bh=zo7L85WEMQspgr+Xxc8ITBFT//tY1Z8VCvuSv/cXyLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVgy+6baLAVYE9SFKIfS1O6UHueX2JqH/iGSIeJMEtwiXMDPfbcoNKWVmQRTsxYqa7UilhTIyYmI/cQVUumT1SSI63voYq+OygJSiaKWucRRjHvFuT7Z8N//4zPw6QMFoRSl/NgnJ9OyoCcj51yUZj5MhTs8dLHnskXbeuqhADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UFR0Hsfm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UFR0Hsfm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A24293F;
	Thu, 18 Jun 2026 21:46:32 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6433F632;
	Thu, 18 Jun 2026 21:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781844397; bh=zo7L85WEMQspgr+Xxc8ITBFT//tY1Z8VCvuSv/cXyLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFR0HsfmIgbVnXQm+nqkHxhtgz5uJsi6PxQu6nA5ExDABz7YYRT7NN2ntqyfACtfc
	 YYTLIoQYxo0u00Td35Ce4bhkgZmFJh0u8l1EU5h2mEcWWIy16lRJl/KwhmY7mFTxOW
	 hsefNn6008dILDD8tAKp+MmYZbEaeZK3tVneAAno=
Message-ID: <9abb0da8-e29a-46ce-af11-55c49b30b1b2@arm.com>
Date: Fri, 19 Jun 2026 10:16:27 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Lance Yang <lance.yang@linux.dev>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260613060637.40039-1-lance.yang@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260613060637.40039-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/06/26 11:36 am, Lance Yang wrote:
> 
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
> 
> Hmm ... do we also need to teach the KASAN KUnit tests about this mode?
> 
> With kasan.tag_only_on_alloc=on, free-time poisoning is skipped, so
> some UAF and double-free reports are skipped on purpose, but the tests
> still expect them :)

Yeah my opinion is that we shouldn't bother - but if we go ahead with this
patch in some shape or form then I'll see how to make kasan_test work with
this.

> 
> Cheers, Lance
> 

