Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431721;
	b=WnLLfvsZc/l4bLkXQYTQD43wXItxDHQr/eahPkKZlSYaFRHykBlToZ3BG+Jdku8CqEtq
	 ISaRpmeRA6qnA4vLUAp4Wbt5RXrGqsp75ZtmXQYep4ozhqbBaFVqeDmzBcTr0KzNNOPI6
	 ow7NEKQQON5xLbnTuiwysrUWWHOS3YNceETdT3sj7SdzfAxjzX30G7Rmg9ueGz18lCVdM
	 T7oR593LL66Lmt8SsFdUTxPC2asYEO6O370TRPmKioCnv7DL74YyxbUNCltFUNCEuFTZT
	 DewmVLbJf2p003p9ah5LQ4pRU92dVMvboYb1AeVnyT9oaygfDfVepBtVYchPnLAyUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431721;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
	b=TPCcG20vFIO+hMdmU4EVnGBKk8Cenbq3L4tZkPjz4dyYQnG6mCKm5NWZplm7/1PrsEuL
	 o732Atr66Fr2lY+N1zdbLZ+QiEyHSqmZ8einkxGY7J8udGLNmXioczbHoYsa9MUYaK+ps
	 pB1HpfE1pYrHb46T4UHjjsCTLhTkWb8Wsf37ub+1Dhn3ZUVCrSchPQxFNDgTXi7hHh/4w
	 jpym+ci+7W8Jk/ymXDEhxZmy2hr0nXJtvpHjdrWr7OoMwHkGxXg0qqZ/LiaSsxVzkzPgd
	 LIftHS+6ZXH3QoGcnj9+Wbm4lZvLjSWN0Kne0GYQWvIxH2kaoA+gCTTXm2da1bSPF0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QbvffP8x;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UxoZbMTm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DC606A31A
	for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 17:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QbvffP8x;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UxoZbMTm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792431720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
	b=QbvffP8xxOhGbaHBOpUeAELu0Gias/LLjHlCsnO5QHQuY1cNgXv6uH05lW50Qs05FodOab
	JYNBGPNDdZ6vAAL45vrdbPpAzswt8ls3FathOeM+dCEy09McDiqUBOO31tyzrSc229vOzN
	Iq9j6SY72X4W1I2mlrkPJYt5rG5dn0Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-IkGx3OaCNGCkRYRuTjMIeg-1; Mon, 19 Oct 2026 17:41:58 +0000
X-MC-Unique: IkGx3OaCNGCkRYRuTjMIeg-1
X-Mimecast-MFC-AGG-ID: IkGx3OaCNGCkRYRuTjMIeg_1792431718
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso476285185a.3
        for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792431718; x=1793036518; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
        b=UxoZbMTm+oOpWM4UEUqClYt+u2lMBHAkrD3m+LliSj4gaivLwRnANv/w/0a8F5jrU3
         e8ecdk7jyl1NXRdedIUG3+Ayr5/Mq5KWWe7TBJf/YJ3UmEUccn5AdK8FoCXtPZ2shgCL
         BjLzpiAcX+aijvF7jFFAmRqD2X+4y18QYaEobYWh0B1BTOiXEQwDWLQRVplfqeoVeDpk
         JShV+i8JBmEv6mO28OUv77Y2IeoQMc1Ko3C9Bjn7oAi/Nz2LRBDEg9QdDdfU3tYAjMHC
         8oNOUK3/9/i3/AsIzXKXRBbBkDERG5/q9ln6UkiL8WrZ4Vf7vhkXucqiKKvb5qk6Nj8R
         BR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431718; x=1793036518;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj02P4ARr8nHFDPAaFaHXc0/AuKhomTGXneezdAxNaQ=;
        b=2gm2B0qg0LxqCf3j1p4IEe78IBm5DgpivWG1d7VRZ7jx36XRPt5+xnBhYjFk1By5L9
         b0PVJvnPiNWxNHatsGmYxdnEYH2rpjUPXLPtDs4CUKZbNJxy/ei+ZER1GmeJwd7Z3Z0X
         b5MMh9Ky4HQ6W3aHer7VZ62oFFMKaNLXBvGpPHRpldnuIlMnZvlKUFDJBMt9CHDBhBZ+
         J+r+A6oR/NIKn8J2whNFFVS7BeQ8jgTk2PEpzryCoarvI/8OTbJ2EM24aHFgtF7ItKto
         ZYgq9Qrysb9R/9Jdi116+aT6YNHy2OJ2HZVbCJ9dDwfLpvge1oEF2XzHG74I8Ff6Yw6l
         TEBw==
X-Forwarded-Encrypted: i=1; AKwUvBwpfUPlprvnGFdmKSIbQf7TI/b1AcYT5GWR5pbFmKONANmfDWOpOBp2AfwZU9UUjN/jbomETt/zSOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKeJizA9KhjFzium94PsS1dK0GHpv9PrteLdOYCpiA9h9U1GlK
	j8eV3983ncMkvSxiIcIEUtvXkAKGosaTpMMe5rvpdIQGSBDkffWaaBrErTF5X2lNBhWA9IgMuQJ
	S1vGIS7pLZYx2wGfN3OjuBglI4kG+6SBNt96e5RXoQmkrWxs+8IDt5Ol2Bm5WGA==
X-Gm-Gg: AYBFou3m2x2pA+dQN89zC9ZG6QaMQplFieeyNxUwZtOLjKNpWtnRzRwqQ/0iYf1w6DT
	rbUzCcgIwU7FjZAsxVRqJNMKt+ZmO/o1uKRHNeg3NIJq9FTqOTUfLXSuRvVbtbIZH+OeHq75yON
	jSvd5n2QBffBt2NLtEVjdZy4U4lh66En0yWiadFPYunbS1ONrwZpDZWFjdaNBSzNyCJstCzIdDw
	CSLZPiO3v3PBVgzUDn/k3jUazulckxWwJqqj+SVW8UAcrBDgu4HX3aTqJlEzQ3si3JOOnAukm67
	4gP46mnJOiyC4rpuiK+lmMkwVvt+gn1+GjAWRr3SP4A5/7O3cX4Et2hPFZjjtZx5Xh4OlkU=
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1386467185a.28.1792431718190;
        Mon, 19 Oct 2026 10:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1386462085a.28.1792431717358;
        Mon, 19 Oct 2026 10:41:57 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c4c2sm1555996d6.20.2026.10.19.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:41:56 -0700 (PDT)
Message-ID: <b2b0296aaef22f8c4db2ab06ac7a708f8321a313.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
 "Lorenzo Stoakes (ARM)"	 <ljs@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin	 <sashal@kernel.org>, corbet@lwn.net,
 skhan@linuxfoundation.org, 	rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, apw@canonical.com, 	joe@perches.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,  Brian
 Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David
 Disseldorp <ddiss@suse.de>,  Mark Brown <broonie@kernel.org>, Jani Nikula
 <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,  "David Hildenbrand
 (Arm)"	 <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Christian
 Brauner (Amutable)" <brauner@kernel.org>
Date: Mon, 19 Oct 2026 13:41:55 -0400
In-Reply-To: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
References: <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin>
	 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
	 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
	 <202610131000.43AB316FBC@keescook>
	 <20261013174243.GC178151@killaraus.ideasonboard.com>
	 <202610131216.C841415F01@keescook>
	 <20261013201628.GO4214@killaraus.ideasonboard.com>
	 <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
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

On Tue, 2026-10-13 at 13:45 -0700, Linus Torvalds wrote:
>=20
> I don't understand this whole idiotic concept of "don't use AI for
> X".
>=20
> Here's a new rule just for you: don't use compilers for any of your
> kernel submissions.
>=20
> Because if you can't show that you really understand what the machine
> is actually doing by writing your code in assembler, then I don't
> want
> to see your code contribution. You clearly aren't competent if you
> can't write it that way.

I don't think this is a honest comparison when there has been a very
clear shift in the kind of janitor patches I have received over the
last 3 years. It used to be only occasional I got patches from people
that they managed to write and build, but didn't understand. It is
incredibly frequent now, and there is a very noticeable trend of what
kind of tools are used for generating those patches. At the dawn of
programming languages, sure, people could keep throwing things at the
wall without understanding what they were doing. They could do it
somewhat faster then before. But it still took time, it was not
instant.

I've spent most of my career trying to push for new tooling, I pushed
pretty hard in regards to pushing rust in the kernel. I've pushed for
gitlab, I've pushed for new build systems, I literally believe that
change is a part of what makes a developer good at their job. If you
can't accept change happening anywhere around you, you blind yourself
to new solutions that could make your work better. I even have started
using LLM review bots like Sashiko, despite the fact that personally I
wish these things never existed.

And even I am not going to go out and try to say "it's just a new
tool", because that's incredibly short sighted and just false.
Usefulness doesn't change the fact we do not have the same social
contracts we did before LLMs were around. And when a "new tool" changes
the de-facto social contracts that a project has had, that seems quite
a bit different then introducing a static analysis tool, a new API, a
new programming language, etc. into the kernel. Rust helps attract new
contributors, but it's never fundamentally changed the way that I've
handled reviewing people's work or handle working with new
contributors. It's perhaps saved me some time, but it's never
fundamentally changed the expectations I had when a new contributor
appeared. LLMs absolutely have changed that.

This is the distinction between LLMs and other tooling, and it is a
large enough one that at the very least it should be addressed with
stronger arguments and a higher level of respect then "You just hate
new tools don't you?".

Frankly - that's part of why you don't understand "Don't use AI for X".
You keep trying to look at this like someone introduced a simple new
tool, and now people are just being luddites. If that's the only way
you can approach these discussions then yes, you're never going to
actually understand what's going on.

