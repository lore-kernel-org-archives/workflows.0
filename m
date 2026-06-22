Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82E33F5A4;
	Mon, 22 Jun 2026 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148407; cv=none; b=rZ1PSSZkJESEPkFEgegdMiwjQQSS7uxym92JQKlIeZFRZohBxMcaOAgHgt/gHt7yK/fN1BEEOulBkRl6gJ6HbjodeRYAI2VMSnlEOMHJ9gACCl+agMLnXaKalEOKYlwhuW6ncQjRipse10Ivy7lCvdp88SijSNTFe7VKGzhMXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148407; c=relaxed/simple;
	bh=RnwiQypkRLn7P8qYZseBV6Ihj32aR3RId+p6z4H6xw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suiYgBa8P9PrmaJ+lYlCVZyIbakfcxI6vPe3ACJWWcHtG8sDgp3Eix9jk1Xf/bhCgIkUVOLGP9YsgHIIgFZMUcxBpTnNMSlazAZkYw7SauqZmpcGTmzlAyGXzhVNWKJYecyd4ajkJMmvDg10X2T0umBXOPrK4WlQFHi9DA9Cnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cB1cmzMz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cB1cmzMz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0191A00;
	Mon, 22 Jun 2026 10:13:19 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.1.32.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EAF23F62B;
	Mon, 22 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782148403; bh=RnwiQypkRLn7P8qYZseBV6Ihj32aR3RId+p6z4H6xw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB1cmzMzT+YCCg7NorZIa+KSxvTRYpIbv/SMaoP0VaMTLqKhCnwscEnPUCC+jZb+/
	 gaRLYTCzh177urdLiaRvwUNvASV/HdLMAMWqfK5gWm4lR38lQmrPWtcwc4xEt/s8Y+
	 xzl5xklVxQ8HOQlcmaoggGEB00Xm26zmkx0NmFW4=
Date: Mon, 22 Jun 2026 18:13:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajltLd6FQg1aMge_@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>

Hi Harry,

On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
> On 6/19/26 10:19 PM, Catalin Marinas wrote:
> > On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> >> On 6/12/26 1:44 PM, Dev Jain wrote:
> >>> Now, when a memory object will be freed, it will retain the random tag it
> >>> had at allocation time. This compromises on catching UAF bugs, till the
> >>> time the object is not reallocated, at which point it will have a new
> >>> random tag.
> >>>
> >>> Hence, not catching "use-after-free-before-reallocation" and not catching
> >>> "double-free" will be the compromise for reduced KASAN overhead.
> >>
> >> I doubt users who care about security enough to enable HW_TAGS KASAN
> >> are willing to compromise on security just to save a few instructions
> >> to store tags in the free path.
> >>
> >> To me, it looks like too much of a compromise on security for little
> >> performance gain.
> > 
> > I don't think there's much compromise on security for use-after-free.
> 
> I think it depends... OH, WAIT! I see what you mean.
> 
> You mean use-after-free before reallocation does not lead to much
> compromise on security because objects are initialized after allocation?
> 
> You're probably right.
> 
> Hmm, but stores to e.g.) free pointer, fields initialized by
> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
> will be undiscovered if they happen before reallocation.

Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
(or realloc, only if the actual slab page ends up freed). But we don't
get type confusion for such slab.

However, without tagging on free, one could argue that it reduces
security for cases where the page is re-allocated as untagged - e.g. all
user pages mapped without PROT_MTE. Currently we have a deterministic
tag check fault if the page is coloured as KASAN_TAG_INVALID. I think
for this patch, it might be better to only do such skip on free in
kasan_poison_slab() rather than kasan_poison(). Freed pages would then
be tagged.

An alternative would be tagging on free only with a new tag and skipping
it on re-alloc. But we'd need to track when it's a completely new
allocation or a reused object (I haven't looked I'm pretty sure it's
doable).

-- 
Catalin
