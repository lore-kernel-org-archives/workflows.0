Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041469;
	b=vur0xWb+vdFf4pQlDmBl/cx2KCiu5sQdui3vvygixN4y3gmxq+n+ILRkq5IQd9o4ta5b
	 jKRlFGi9iRhIdLQZvHUowMlK48/YjyilYTCkq4vGoUpEVIesqY4fvq9aEuqbYBhzxA37f
	 k8+5yxI4/MwYGD7DUxfbkvIqxP1CsisbtPuf5rf3t5UmxoEPwJ/PfWZ/pfHpaD/4l2u7h
	 1qecdscz5aKvxHwXFZivS2l/v99rCpspSK+rXqVeUzWNN6jGdwqSYG6MtZZNDg6zlLebd
	 JsfHI4OwuqBZsjwwL2TNrZLELPmqZKqURtNMESCGfWux/Eo1QjP93szmkU62fuhtoqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041469;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=OD6FHw0+OOnlc+ZpqfgihxN2ml8gDoOZmvF069car6s=;
	b=2az+NuTa1OcgG407s18vKir9BfNNUV/Nq0HW03864hhiC/ggQSYfVveTmJ4p4bujqk4r
	 jMg6CsZhEQ6rLrFBmAG9lB0D5tqsGWWrgCC348QxSwaM3h6+He33Mw8/jG24UK1tTgVvZ
	 Iep2kzFblYSQXYPXoKMKERZ0ZUCHTgiTpxdskWmTX6RDkI3uiVzEwL10EmCBXWfNiQQ4P
	 mG//eC4M7zxE1H8CfTKROdRgbcFayixTXHkLb3hj97brgQ0CSPhtc1XqOWIHEefYpUUUW
	 QxsgFViJfBd/DA8n8qM7cCbgpTXnsyHybHk2qZRGkpT7RxKNSFigzVH166Ipz+wmsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PiUUVxSr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Uh4lJlDw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956AF606A31D
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 19:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 956AF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PiUUVxSr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Uh4lJlDw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793041467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OD6FHw0+OOnlc+ZpqfgihxN2ml8gDoOZmvF069car6s=;
	b=PiUUVxSruI8tzW5Pay4Z1WUUa2UW4Xm5+ALjBbOUZDTkIZllXoW5Q1E/mZuBNQ6iAArF9l
	U5MmGj/vuHxniaZVvYT17sorS9UPmF9A6N3VdYXSFKKbrpXRIQo3p1IQxXKMcv9r3KLX8i
	svCBFUv7G6gr7UvgLybM3tWOg9SuhXY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-5Fd2bgNDMdugrpA2_eGbHQ-1; Mon, 26 Oct 2026 15:04:26 -0400
X-MC-Unique: 5Fd2bgNDMdugrpA2_eGbHQ-1
X-Mimecast-MFC-AGG-ID: 5Fd2bgNDMdugrpA2_eGbHQ_1793041465
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so600802585a.2
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793041465; x=1793646265; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OD6FHw0+OOnlc+ZpqfgihxN2ml8gDoOZmvF069car6s=;
        b=Uh4lJlDw0byFqqUZB45mkvAhplQGtJAOtxCEFcArW8Kbd6tiPOhmxWDhRFsu8OvXjU
         ARLfpzSgZLzEaVBNFdJluNRqBylfuUkbQFp8bNrgXvusROqDnxXSreSBG4TOJuN+uFGP
         j0Q00R0KWwYSXtvqHmso2pRIXYQW/P4M5vCz7LmDkjqIbwz6/6ldlDNxz0ZpaA4cEyVA
         Tmsw6Mm/Gdhv0zQEtplv6IY5JrlD1iwYtYZp/B1FduYILhkVQPPFWFzuc/QIPNywaA0X
         Kl/SRGMju1aiPKAr6COQp+mJsAl8puu53fxt3/MgJsZ6rpbSy0C5Lj3eE7yKx4M84JpT
         881Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041465; x=1793646265;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OD6FHw0+OOnlc+ZpqfgihxN2ml8gDoOZmvF069car6s=;
        b=0yEra9pjtC4hgPOg33TzdnX8KPFlIRNAK2OJx1ps9QoLsqPki9BaG0IXohzV20ZMKw
         nsPW8hHmbsJ6yF+Wr4akp3j8FcvUwKz4WJY2Jyq8QmFpk8FqlV99f+23i9YC8D4f1wh0
         xzmH8T6toFR7v/pUKBnjKppK/iPP1PqGsPsioRebMibV+isK382+CV0nCBLnRXVAHPTT
         2UlEN9PsaBrERkTRSA0A2k4bjr9GhUebi/h7gozMhqa0jD0/RifzroM4W6+rW6XN55cS
         nQFo8UVUgg5DKwgQtB1MUDSxV577nIhSgsAo3IsBmEz4XOwWpiMhIAaPWDDuz1lKfkKm
         TpTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxERDs3t/pg+Lq+fxW/MVtgmHefSQbfCrPasEC5d6eFYWBUwrIQ7ul+13ThgAYfDjUAsIRD9uUX1I0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiGOvI/9lLBDmwLi2zbJC9dQ93vu8QUJ+zSUFIhMzNW7t+wENC
	6vMrtV/NhnOrHNzYiYeMtIEvpA3xUzwDhCD1rtjmoh8m9/3uKZN2kySAWOZJ9+O577qOeZ1TQJ6
	HOmt/WCwcDibUqMi+L4MhHovJsGXtB5qmo/wz37sokZ4QKsdzsw0jzeSuBRXlnw==
X-Gm-Gg: AYBFou2YtVAu9/Itlr0yzEsKDLrumP5+he0H4X0cm6o3yddTo+wE7otmMvMPDGJIIEU
	WNGCIebXzuFJuvyUpGH8i1BNmfYQ3rJupvcA59ayzO1nGVp6KkHxR7eCfIRIOYa80Gf2ATfhYCs
	nxubyG7fpjY64B3xTLsXh0P3m92C6Gjo3zWinCbVXawUa1mXrS5SAKK3+eS/jJfGLwV1KB6s39o
	5NuoiR4PM+IBgtgTWBq3TTW8hcjSBRh6HQtKGmA1PGHfkQ6IZjLkxh2bN7IVDUpUl7kTzfdwxSJ
	5iYvZRl7ylfNpmjBRYqkhp3TQGRBkfeBkoudvVeeV9HEJoYwh7Bro32R+RzUp2VUwbbBJEw=
X-Received: by 2002:a05:620a:4001:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-940ef946f8dmr1065314985a.39.1793041465188;
        Mon, 26 Oct 2026 12:04:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-940ef946f8dmr1065307685a.39.1793041464544;
        Mon, 26 Oct 2026 12:04:24 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c50495sm79606786d6.24.2026.10.26.12.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:04:23 -0700 (PDT)
Message-ID: <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Troy Benjegerdes <hozer@hozed.org>
Cc: Theodore Tso <tytso@mit.edu>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin	 <sashal@kernel.org>, corbet@lwn.net,
 skhan@linuxfoundation.org, 	rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, apw@canonical.com, 	joe@perches.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Linus Torvalds
 <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino	 <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori
 Koolstra	 <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig	 <hch@infradead.org>, David Disseldorp <ddiss@suse.de>,
 Mark Brown	 <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens
 Axboe	 <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"
 <brauner@kernel.org>
Date: Mon, 26 Oct 2026 15:04:22 -0400
In-Reply-To: <atjjQ0oupQ4pmKHB@false>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
	 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
	 <atjjQ0oupQ4pmKHB@false>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> On Mon, Oct 19, 2026 at 12:32:21PM -0400, lyude@redhat.com=C2=A0wrote:
> > On Tue, 2026-10-13 at 23:23 -0400, Theodore Tso wrote:
> > >=20
> > > Using AI-assited priotization may have some collateral damange
> > > because
> > > it might not get the prioritization correct.=C2=A0 But ultimately, if
> > > we
> > > get a flood of patches from newcomers, the choices is either to
> > > (a)
> > > load-shed, or (b) burn out.=C2=A0 And of the two, (a) is the better o=
f
> > > two
> > > bad choices.
> >=20
> > Why is there so much talk around trying to automate portions of the
> > review process with non-deterministic tooling (don't get me wrong,
> > things like Sashiko help) and not "we really kind of have a problem
> > not
> > having enough maintainers"?
>=20
> It *is* possible to make a deterministic LLM, and this is why I think
> it
> is critical to my personal future to have an LLM that can actually be
> understood by a human instead of a random number generator casino
> that
> sometimes puts "4" in your private key.

I hate to break it to you but that is literally not how large language
models work. Random selection against weights that affect probability
are literally how these systems work. This isn't to say that models
cannot call down to deterministic tools, something that is quite common
for things like Claude to do (less embarrassing miscounts of the letter
r in strawberry). And that can give the impression that suddenly
they're deterministic. But the part that is the model is still
inherently probabilistic.

To fix that would mean abandoning current LLM approaches. It's not a
bug, it's literally how models work - they take input and transform it
to what looks to be the most likely output to follow - in other words
it is predicting tokens. The likelihood of whether one thing is chosen
over another is determined by weights, which by their vary nature are
probabilities.

On top of that, if you were to try to suddenly introduce determinism
into LLMs most of the workflows that people are using them for simply
wouldn't work. It's not at all unusual for LLMs to only end up at the
correct solution for a problem by more or less brute forcing it until
it arrives at an answer that looks correct. If LLMs were not
probabilistic, this approach wouldn't work because it would come up
with the same 'solution' to a problem every time it makes an attempt -
which would mean if it doesn't get the solution right the first time it
simply never will. That's why LLMs are so incredibly resource hungry,
you are basically brute forcing intelligence.=20

Someone could do something differently in the future, but right now
every single industry leader is following the same idea of "if we can
keep adding computers infinitely we can do anything" with the idea that
models will simply become perfect by providing them enough training
data.

>=20
> What this means for this discussion is a clear process and social
> expectation on the core OS kernel development community that humans
> who
> use this kind of technology for an open source project make a
> machine-
> readable note in the commit message on what proprietary tools have
> been
> used.
>=20
> "Assisted by: Claude"
> "Assisted by: GNU/LLM/Linux"
> "Assisted by: <redacted>"
> "Assisted by: Debian"
>=20
> All of these tags say way more than a simple binary flag for "LLM was
> used".

From a maintainer standpoint "claude was used for something somewhere
at some part of the process" is not at all a useful piece of
information. It tells me nothing about how the person writing the patch
used the tool to actually create the patch. And outside of that
specific question, there is quite literally no relevance. No
maintainers actually care what operating system patches were written
on, because that doesn't affect the actual output of the code that is
being given to us. The same goes for whether or not it was proprietary
tooling, the kernel has never at any point in its history been 100%
written without proprietary tools. On top of that, it again doesn't
make any practical difference to the code that maintainers receive. In
that regard, I'd even go so far as to say the LLM in question either
doesn't actually make a difference. Regardless of people's opinions on
the quality of the output of one model vs. another, a maintainer still
needs to read the code and understand it to the best of their ability.
Even if one model was more likely to spit out bad code, in theory none
of that is going to matter -if- the person writing it actually did
understand everything in the code that they sent out and looked through
all of it.

In reality, I don't particularly agree with the idea that people can
handle that kind of review. I think it's very easy for us to feel like
we can, but more often then not I regularly see that's not actually the
case with people submitting LLM generated code beyond a certain size.
And this is in part due to the fact that if you did actually review all
of the code the LLM spits out, you wouldn't actually be saving time.
And in addition to the fact that I have always seen a very clear
difference in the understanding I and most maintainers have around code
they've reviewed vs. code that they've actually written. I would be
naive if I said I could understand a reasonably sized patch or patch
series (like, hundreds or thousands of lines of code) at the same level
as a person who wrote it. I can understand the jist of it, and I can
understand most of it, but the portion that reviewers miss is intent -
we have to ask the author why they did X/Y/Z, but the author (usually)
knows that.

This is a big reason I advocated for just clarifying -what- the tool
was actually used for. When I'm getting a patch that was entirely
written by an LLM, I now have to review it with the understanding that
we don't have an author to ask questions or retrieve intent from. I
can't understand what someone was attempting to accomplish if they
don't accomplish it correctly, which can lead to substantially more
review work. But this is only the case with code that is _entirely
written_ by an LLM. I think it's quite different when someone say,
writes a patch by hand while using Claude for answering questions
around the codebase they are working on, or if they used Claude for
finding security vulnerabilties or subtle bugs that lend themselves to
the kind of pattern matching LLMs excel at.

Which was why I suggested "Reported-by", "Co-authored-by", etc. the LLM
model in use might not matter, but how the person interacted with it to
get the work that they sent me does matter quite a lot. I don't get
that information from a simple "Assisted-by".

