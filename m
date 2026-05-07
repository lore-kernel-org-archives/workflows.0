Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B23F0AB9;
	Thu,  7 May 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168912; cv=none; b=UhREov4PWuyZZNDPGpj7kwZ1GPpv5twXmk7JNDZiTkK8GxTfaG7klJIPvOmMDeVMDaS0mdtaiDPYc9l3uh7JfyV9pMZ3tiG4TGhzjD06Ndmte2msSOOa4RIOdU16/9V7VlNLF6J2AeXZFOOxfQEqZaywSTKaroRkZsyxI7I0gWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168912; c=relaxed/simple;
	bh=4k708+yJgijtyuEfobxbpK2395SXdLW0GH+pKYXGUeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEX2c6kiN0rLDZHjmFfVmppio8qtXqOviNvC7cCg2cxRrIBmqmA3tL+1PUPDKT3EmyxM6V2HzYpNdOdQlDPQ/0rp6BfkI6Wk0pXap4aAsbj+79iXGHtFSkPJWC0lIuTIQbPXPCr8Sfnmr1D9gImwkmYrIFY7LdhilooVT4Do6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=kPf7nFv4; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="kPf7nFv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778168907; bh=NIKYqk/gupUBQOkEkSxhtuLCML1wE5F748e7DBVnWLg=;
	h=From:Message-ID:From;
	b=kPf7nFv4a+AnK7nah8DwyKG6mdUuS9EHe2nv9lVdVGic/CNF53lPJxNfqYZ9g8ffc
	 0sgy3jgAnfCsQY4uRRd06CVqEWedFWJohB7V78pRjCTrJNDv+R4VfRcgqOnXW2+6Es
	 oSfeut39sPn64Bmxwc4dQLjE3pN5QkqtCKLAB5HY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 6FF62C09EC;
	Thu, 07 May 2026 17:48:27 +0200 (CEST)
Date: Thu, 7 May 2026 17:48:27 +0200
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, greg@kroah.com, leon@kernel.org,
        security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <afy0S-C87xn9DWUn@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu>
 <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
 <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>

On Thu, May 07, 2026 at 08:37:29AM -0700, Linus Torvalds wrote:
> On Thu, 7 May 2026 at 00:07, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Perhaps also note that including a reproducer for a crash in public is
> > fine, including a full blown exploit is not.
> >
> > So perhaps that can serve as a guide
> 
> That would be a good rule, I think - and I like how it has the
> advantage of being very explicit and black-and-white, rather than some
> "I think my bug is so important that it should be sent to the speshul
> super-sikret list".
> 
> Because we all think we are special. Our mothers told us so, and even
> the AI bots are typically explicitly told to act as experts. So they
> think they are special too.

These points correspond to what I mentioned in my second message a few
hours ago, but I want to protect maintainers against the flood of crap
they're not necessarily used to. I think that the balance I proposed
could work as it more or less covers this. When you have a time to look
at it I'd be glad to have your opinion/criticism (sorry if it's a bit
long but the topic is far from being trivial).

willy
