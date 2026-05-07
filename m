Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9846331A41;
	Thu,  7 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137649; cv=none; b=ndVYexNKJG/D/fW4fHCClgRh8clAt6yy9kH2OoSGJ+Q4kckUH85tVMaimSuNfrsphylwqowRIo9whx/iC+VPcHf8DJL6DWZulSASwElov4MG7TxgjCLL2MaSoWv+AYXfbUmCr1JETTnN3O01IOllbyMojUlbCJL9LUwUwfib6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137649; c=relaxed/simple;
	bh=ESmE7eblFvNRQf0q2NVO+XAo76p6O/u7IC8Vm2QNK6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL58zCN6cIiZG9GWubTg2GG4e1tJ4bl3hV6Ejy5tnN4OhnTwv/BY7s8UrjZQZva+l4o368EYKa4E6QBFLpwc86/Kjmltsv2ioWwMQl/rEH3F/TaByROJ9iIshnRfeYEIrTEAehUE4RaWgANk2lEU3GIjsdNfaf5YLDI7emCHNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bp3HV9gv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bp3HV9gv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=172uLBt7pvqX3Oeco3DVtUK+J1WNUb8fZqxlluFT69E=; b=Bp3HV9gvwOlTE/9uLwhslKJe9N
	OuLkZ3g2YqHb4ahVikhdDH8a15mP1PDoJdb703sx9pIN+OATV+xBkEGNp2gBc/E/gRt1QqCSLb1M5
	qRNj2Fm7aNpjxjXQJucxLqP7P+QeUUQWRq7QYu4MzMtEdW3WAcjvrmzxPImhTsnS7xeoa6LoKeGSz
	LxBkyjl6JdoqufQlNZEhpctzYioOtJSe+flI/bCpSjCvl3dnv54vaOWmvalKZEL5LuS2D6Jtfpm4Y
	ngjW340rY2/JyCAAujMxP8S+rXaefbzufw4or0Uv3EpZpD1RApGT23YfksflqHkT8cuRQZq7eXEZz
	No3Pm3vA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKspN-00000002RFf-1xEg;
	Thu, 07 May 2026 07:07:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CFADB3008D6; Thu, 07 May 2026 09:07:20 +0200 (CEST)
Date: Thu, 7 May 2026 09:07:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, greg@kroah.com,
	leon@kernel.org, security@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aftmB435XJ8FP3V_@1wt.eu>

On Wed, May 06, 2026 at 06:02:15PM +0200, Willy Tarreau wrote:
> Hi Linus,
> 
> On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
> > [ Coming back to this after a week of trying to clean up the disaster
> > that is my inbox after the merge window ]
> > 
> > On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
> > >
> > > The use of automated tools to find bugs in random locations of the kernel
> > > induces a raise of security reports even if most of them should just be
> > > reported as regular bugs. This patch is an attempt at drawing a line
> > > between what qualifies as a security bug and what does not, hoping to
> > > improve the situation and ease decision on the reporter's side.
> > 
> > I actually think we may want to go further than this.
> > 
> > I think we should simply make it a rule that "a 'security' bug that is
> > found by AI is public".
> 
> This would definitely help us a lot on sec@k.o, but...
> 
> > Now, I may be influenced by that "my inbox is a disaster during the
> > merge window" thing, but I do think this is pretty fundamental: if
> > somebody finds a bug with more or less standard AI tools (ie we're not
> > talking magical special hardware and nation-state level efforts), then
> > that bug pretty much by definition IS NOT SECRET.
> 
> I think it's only 99.9% true. I mean, I've used such tools myself to
> find bugs that were not found otherwise and I know that:
>   - interactions with the tools count a lot
>   - luck counts even more

Perhaps also note that including a reproducer for a crash in public is
fine, including a full blown exploit is not.

So perhaps that can serve as a guide; if they went and put in the effort
of making a full exploit (with or without LLM aid), keep it on security,
otherwise do the public thing.

And yes, I realize this too might be a very thin/short rope.
