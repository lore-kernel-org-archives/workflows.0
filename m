Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043614;
	b=DiGOU0IdrwYlteRPf6KiNw0+alZ2xof+6fk9oJza+TLK6orvS+7KIJ6UPrLe+Ruch0z8
	 IbaOm675QW+qboq1LJEjrdqXNdma36v/JSIsC6F4DC7866VCTMVCTVUgPuodM58+nNnWI
	 39gYnlSDGFoCQuXbajwGzCSLrk28HxuTrYY7//Dqy+imCJ4ns079JdUmYwo841UygGtWE
	 1qBitJxbaeA/PfZK2uTFVAEcQRXbj0Mf2rXc+fh5EaRMWwimlJEIjV4xRw3KjzRhNcDnB
	 Y5PRyILxGNVj/FSy5p+FQWHX323x4mDEdg+6VZSfFgzkup3B+TUKUv1n27VIA/9IOcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
	b=qHMIaaSp2vKskc3mw5PQeMrbMXIq2DW6pK8txI7abVBjvQ2iv2rnkRP1iRGrBxIxWoVB
	 SHxDkkcWOQrInbHDpkClApmC3KB7zzTjsq5OTZAafd12YFDJ7MvQDXJc7TJOfKkLXjDDj
	 JSEtnDriergiJ0CdwcV9ZPfIxsXDio/U4O8R1rUl8iFEnqspDNPwuZhfYWzj/3YswhZj2
	 zTkSPXykIzkf252Q15f+mXa4hEfFBW2d00xWJ/n4C+VyrxS9A7ZCJgutkCEwQAXf8ZqSO
	 xjBkAYrrL/cz9LYwf7bYojyOSA446BxQWNJbgPLs/KzZXm5wLULgGw9fhIwvgFJIWRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BzElhsSu;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0C606A32D
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BzElhsSu
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso516283266b.2
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793043611; x=1793648411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=BzElhsSu4kdqUjgDeKk7OuiBroKAFuwlm4RJL1hwaoL1P+IYSlebMHfKT4nNdKjScj
         jelgJRtSsmAM9NJSc3BkeLxcR03IgUn2vFRV65QCh7u5Nald0Z6wiUgbCk+eNxx291E0
         CNY1LCawMd3od4vz2c9QmGGGQtbz6oQ0oWvaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043611; x=1793648411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=LYZhcVtuRz763VHzHeEwB47uAXWwLXAYBwdPyEyJIphyvP5cLK79HqYXfMKmXon6Ee
         XpE2Xl94gIDyqaYc9h2NR402RT3mcDnYaieKir4ys06M+rM6H+IiQEvNY/lDaLGY8HrD
         38xYx2fEKZc+fHHQi2nBiO6Qeb+aACnaHAHP8ZpEI28L46M6Ed7mvYOYI6pkEC54uA8k
         Ps2PTUrNE+Y725raIl4ZaFCBrjr8XAv0PAl8XzMxTHJUMu+UzJwbPogOo12/3SAiXr3T
         ZiqyQqzI8s7xgohFqIuEv4B3HoqMHgZOCYJ4gq1KU9Ngb3V+o/oR/zYQpnCnjg+4Ydm9
         KBqg==
X-Forwarded-Encrypted: i=1; AKwUvByhU/6f2R18za9/8p1ssR48JZlcy5aRoCGHG8QJrUAhCCmhAtm9zWgn0cMbhW24Q9dMer9tjpX8UcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1G7XT+59/IO4byHuPimzKDwcjSQgJwAPDcaslBhtmej+68vNU
	xsTHB/9KZa3DQGDBKNrXUznFuU9r6BeIpS1gg+lJrRHlybOq5hrSgZbeliRIzOWr3dii1e1oCSY
	haIvyjoY=
X-Gm-Gg: AYBFou3WQPF/We5UT0V4GeSpiupCmEJokHf0D6lF1LY/RQDwKTSMQPvDD+xEEN09H4h
	fcvpp+7aTqfkOAutzpYTlxJ6mDXlAKESBPaCJfSkxLKKufCy883tBDB4vCNWD3CIw29rrtCvccd
	MSQEatPiK65kAQmtqES46nJPii7xhLPCufBQkIjhSh5Bj1yXSkdGn3qSyppv27iX59HazJaDU1J
	+5Kg3fYYvPwh30wJCMA2sSLGDQaTyIHxrmvJ7sPsz+wjsl+oAv7n7Q511R4tbvw28mY1We+CZ6k
	51PfEs3dBIWtQQkHpj74j85GNVFVhRmxt5LAD9SOQgZOhkJQJ/wwhwbyfqLE1tHR7MQoo4ok4Jk
	ezPnLDsbz0mYHddU8KbjneDw2AB1UeR91DVohENxooxmUW4HKCCdn4CF39reBQOFwkOzcUNUqFM
	roXmLomScwkdMgCz2tSzvd8ZIjmMAI5NffPVtK5gppF7dP9LLxt2s3O+TgwDq0CF7VVn9ryYN9+
	1mKsvwIoBeLJpPs0sLapeGKmHtCe+MG1xTYD5w0FLGLdN0CzLp5aiEMnMvXNZEIIp5JEsLr95cP
	NVdm96GssIPlUMqMjIzcn64t2AHGhg==
X-Received: by 2002:a17:907:72c7:b0:c46:7643:ae91 with SMTP id a640c23a62f3a-c46bdbeff8emr838201266b.8.1793043611394;
        Mon, 26 Oct 2026 12:40:11 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524266sm363016066b.38.2026.10.26.12.40.09
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:40:10 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso516277466b.2
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 12:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwgPorOn07lZJOUqUNkl/OZyrt0O/pjBwudYYocU6G2L+eOC0V1jFhvV8wL6nbjSQFTgxPhaiHuEU=@vger.kernel.org
X-Received: by 2002:a17:907:868c:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c46bdd91e31mr838852466b.30.1793043609404; Mon, 26 Oct 2026
 12:40:09 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009083137.3-1-sashal@kernel.org> <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu> <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false> <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
In-Reply-To: <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 09:39:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
X-Gm-Features: AclHuK8CltFtaxoX082v5F7FHYz_r6xWqul5HdmUaOSix11A_HqM4exVwrrtVNw
Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: lyude@redhat.com
Cc: Troy Benjegerdes <hozer@hozed.org>, Theodore Tso <tytso@mit.edu>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
>
> On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> >
> > It *is* possible to make a deterministic LLM, and this is why I think
> > it
> > is critical to my personal future to have an LLM that can actually be
> > understood by a human instead of a random number generator casino
> > that
> > sometimes puts "4" in your private key.
>
> I hate to break it to you but that is literally not how large language
> models work.

More importantly than that - the whole "deterministic" part is a total
red herring.

We shouldn't even reply to that idiotic argument.

Why? Nobody is arguing that we should stop take human patches because
"they aren't deterministic".

So anybody who thinks we shouldn't use LLM as tools because of that
reason is just being dishonest. It's just a disguise for "I don't like
AI". It's not an argument, it's a complete strawman.

We have had non-deterministic tools in the past. One trivial example
of that is just different compiler versions that have slightly
different instruction weights or just different rules. Even when they
are individually deterministic the end result is effectively that
different people will get different results.

And not all tools have even been individually deterministic - actual
real non-deterministic behavior exists in non-LLM tools either becasue
they have timing issues or are explicitly using random numbers as a
way to get their results: Monte Carlo simulations is a very real
thing.

And yes, non-determinism adds a wrinkle to things and it's something
that needs to be taken into account (and people often add things like
explicit seeds to avoid it when they need explicit determinism from
otherwise non-deterministic algorithms). So non-determinism is
something that should be weighed as a factor against what else the
tools brings you.

But it's not actually an argument against LLM's.

              Linus
