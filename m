Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307C431B828;
	Tue, 23 Jun 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234715; cv=none; b=mR/grld0gjLWJWc6Whv4AnXKQk718Fm63KCyroWnxc1P8UFnRuaujG892jRyhoCrdKTNlYYoe6u0aSZrqEqZ3amsj+bwSIVklFuByNl4TH5vBVryvOJCGD9DSvdK9b8XAaZ3Y2nJNp2bTGp+fQ15iinliShw1ZSBpqaqTXdE5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234715; c=relaxed/simple;
	bh=Dxe3mvHcxdglVG7y4dd4JmaJkVwRDW0juOrCiKYqNmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS3Q/GGLlVasFkHWqXM2v81er/jyj/1Ba7bcJqL/kG87gchLX69S9ouFAig5O5wjnppwVPGP2VkPlNUx+esMM9rLf7snmUngvv03o8RItaPfA3c9y74e6IGZSO/O/DLEOqoSNF6yl6IffWersvtuS4O+8lGFQVtE+FopYr75mjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GqGg8pmM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GqGg8pmM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C0514BF;
	Tue, 23 Jun 2026 10:11:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 290E03F62B;
	Tue, 23 Jun 2026 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782234712; bh=Dxe3mvHcxdglVG7y4dd4JmaJkVwRDW0juOrCiKYqNmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqGg8pmM+4me4s427XLrPiVTIz4+Bk5hJxoH7b02XrTCiKzTMeZEr81wh5odqYxCq
	 Uvscfxy4Ql2su1sbLaQdBANm5mQCX+XE4vv/H7J5V0E+6hfqZv7oXxs9L287NH/Sgp
	 RNdKP8gA1DrJD2dJ+px4es/a9yQ+tJYHSGjgwQ4Y=
Date: Tue, 23 Jun 2026 18:11:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Harry Yoo <harry@kernel.org>, ryabinin.a.a@gmail.com,
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
Message-ID: <ajq-Ukmd9NBruhr5@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
 <ajltLd6FQg1aMge_@arm.com>
 <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>

On Tue, Jun 23, 2026 at 10:32:16AM +0530, Dev Jain wrote:
> On 22/06/26 10:43 pm, Catalin Marinas wrote:
> > On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
> >> On 6/19/26 10:19 PM, Catalin Marinas wrote:
> >>> On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> >>>> On 6/12/26 1:44 PM, Dev Jain wrote:
> >>>>> Now, when a memory object will be freed, it will retain the random tag it
> >>>>> had at allocation time. This compromises on catching UAF bugs, till the
> >>>>> time the object is not reallocated, at which point it will have a new
> >>>>> random tag.
> >>>>>
> >>>>> Hence, not catching "use-after-free-before-reallocation" and not catching
> >>>>> "double-free" will be the compromise for reduced KASAN overhead.
> >>>>
> >>>> I doubt users who care about security enough to enable HW_TAGS KASAN
> >>>> are willing to compromise on security just to save a few instructions
> >>>> to store tags in the free path.
> >>>>
> >>>> To me, it looks like too much of a compromise on security for little
> >>>> performance gain.
> >>>
> >>> I don't think there's much compromise on security for use-after-free.
> >>
> >> I think it depends... OH, WAIT! I see what you mean.
> >>
> >> You mean use-after-free before reallocation does not lead to much
> >> compromise on security because objects are initialized after allocation?
> >>
> >> You're probably right.
> >>
> >> Hmm, but stores to e.g.) free pointer, fields initialized by
> >> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
> >> will be undiscovered if they happen before reallocation.
> > 
> > Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
> > (or realloc, only if the actual slab page ends up freed). But we don't
> > get type confusion for such slab.
> > 
> > However, without tagging on free, one could argue that it reduces
> > security for cases where the page is re-allocated as untagged - e.g. all
> > user pages mapped without PROT_MTE. Currently we have a deterministic
> > tag check fault if the page is coloured as KASAN_TAG_INVALID. I think
> 
> So you are saying that a stale kernel pointer can continue to use the
> reallocated page, because for non-PROT_MTE case the page does not get
> a new tag. Makes sense.

Yes.

> > for this patch, it might be better to only do such skip on free in
> > kasan_poison_slab() rather than kasan_poison(). Freed pages would then
> > be tagged.
> 
> I think you mean to say, "skip tag on free when freeing pages into buddy"?

No, I meant always poison via kasan_poison_pages(), as we currently do
with KASAN_PAGE_FREE being set.

> So that would mean, kasan_poison() will do the poisoning also in the
> case of value == KASAN_PAGE_FREE.
> 
> > An alternative would be tagging on free only with a new tag and skipping
> > it on re-alloc. But we'd need to track when it's a completely new
> > allocation or a reused object (I haven't looked I'm pretty sure it's
> > doable).
> 
> That was our original approach, and IIRC we had concluded there was no
> security compromise. However it is difficult to implement - it has cases
> like, what happens when two differently tagged pages are coalesced by
> buddy and someone gets that large page as an allocation.

Yeah, it's fairly complex.

I think the more problematic case is when we can't detect
use-after-reallocation and this happens when a page is reused untagged
(probabilistically, also when the page is reused with the old tag). As
an optimisation, it might be sufficient to skip poisoning when freeing
an object into the slab but keep the poisoning when freeing a slab page
into the buddy allocator. That's where the page may end up in a place
untagged.

Also for your optimisation to only tag on reallocation, do you have any
code to read the current tag and avoid reusing it? That's useful for
kmalloc caches or other merged kmem caches where we can have type
confusion.

-- 
Catalin
