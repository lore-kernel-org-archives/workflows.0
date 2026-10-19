Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426557;
	b=Ey3mfVVMPhSaKtvtbKp8H0o4/QQp64TRU7KbxwEiNirP1B8apc2X2u6VmvMxfpTWYAJF
	 z0DXjCGuTRnDxhor8VkkVGpARkpvAwXyhW7CTkk4JGepiRfOJeOp/yqxTPnPyjJ0yga2p
	 YVdzBQJrkibIpNJNhvk9Cv0VDgDIknI7uJppIKY4SpMkpir8H4uuCzDb6hweJPfXNiD5u
	 6HcqJJLrxrIQ2bejjkbgkdtA1QCjWw49RJx+Qv4O8GPyQwAKzSjcBvuowrC9CMrz0gcJ1
	 JtDYM4tmTibtpX4YVhcSTIdJDFGBlJHaBc6Mf7bl2kiUP1XjIffuZoW7ALQoEU7aIDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426557;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=WggwsB0+bNmgsViKNBOFRtzyB0+iinAE+TrnbJLwfbCtEHV9V1v6rNiTIHYpwqFQAUS2
	 Mn9TBh0p+XxkX351lB9cIJY4i7QQ1PlEiXFVEGqr746m01+FJzLCjCBgIPVM4CKUk0z9A
	 MmM0nbttIOFsTzCaLKJlyDtmfcb2zJtJEvWKLenEdJ20HEt4qB6ih7rdo/JSphvCYUnun
	 c2kAWBCuItq70wlKasCNbv+y1MEUzfIy1tXLerdDOXc4g+Dc3w/dejdsiqVt1u9gX+mAN
	 ysr7lWEVLwpiIVp7c+v0H2bWBD+V4/hlOiFHBVLWTSrMI/PQSjX3jVe89JxFU8+8DVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dz9J9N9B;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0B606A31A
	for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 16:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dz9J9N9B;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792426555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=Dz9J9N9BQ/IpGRuad+OzQWpExzQ2qUXSjxOIBmKE3NwTluR3yoqul50RcHLT6rMCqHvIIN
	JfltOHFzEhkrhaxKfwS4G4JLExxVkxfppoB7hwjfJIqjcG1wBIe7SH2FZAJBe7LhUAHN+7
	+7sOeJH3XejKEWAaxImoZG6PCTEfwCQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-f9O0vVZHM5KhaSlNoc2osg-1; Mon, 19 Oct 2026 16:15:53 +0000
X-MC-Unique: f9O0vVZHM5KhaSlNoc2osg-1
X-Mimecast-MFC-AGG-ID: f9O0vVZHM5KhaSlNoc2osg_1792426553
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823d73ffca1so3741053a34.2
        for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792426553; x=1793031353; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=m6V++kXF+0jMuveqDKrirlDPJaYAuVm24hJJTa2PdUmC9iVitkhjayI3wkB+HDMomN
         0+NsRJ2bY03K3ZhUiG0FZt+KsOeTqzHKsMG0zitwXybfGMehs5aSv3CjfsYRDlW/eOZR
         qw1H9Om3FsgE6n6VYxMl5eWkT3GRO7nRJkqXLtM1czfuVCNk+JzI7uq+mSAUcUgAxt6W
         GoE5C/CoiYJ40pzz6gPDe4rRC2coDFrAxdjhcTwz4us8XMRovdwhWrc0Qt/nB9IHeQd9
         XmkVn4Va1RW+ntMOAuW5KJFZ7PC2D9NKx/ogShcRRxTLw1uh5W1djvhAjG2Fio4SdVed
         Xx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426553; x=1793031353;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=NqHRgJiiPPezueeNl2+IfzoSodS0J6yk3uUqauyonczFXaMDhL+hJWKsIHMfgwT0WQ
         UQX8q2iJAZE91Vc+vr7VFhgtoLVsR1R2QEDevqxPgklJk+orbRV1jyCAf5AruzGMxFeE
         dbDyZUFhnlKX+gg5CCi0+k44Fj6anJw/7FDHNw0S7lYP5x1aywNn8dvWm3gmpuwCfhp6
         vIQiXLRPYWeIquN2Yq344KITZO7HZP1VAh423391Gbhc4hfiQticTNGXX78OHVaAdTun
         BRyE17PtjdhzVPAdcZ7lFa+8p6ttsICY31qXH7pDxABUGIEO7HRabq+0E6XoJXUGVpK4
         UH/w==
X-Forwarded-Encrypted: i=1; AKwUvByknTodsuR64RPagfzCSRg3b8lFAYD/goqa7bXvU3BNiwjm+agQkFHXZS+7V43d9fpZLXw6OtoziPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB9t63LiCN1NudS4KRW6Lj6g/UqMoFs6VYnsy8F3jwbywkAekX
	A2wzcMxncyC7WGBOiZHsi8mytTeWY8CzE2DJ45tdxL/Kzq4Fg6eDLLmSHJfsW88RYlIGkTy72iL
	trWlBtuImckkGLRcOuB9romOQeVkuwrXGR8ThAKSJ+Mr5A8sLbd3HD6KBxgbtFoCERR9uiQ==
X-Gm-Gg: AYBFou0qRCHXeKqKAkwye59N7EoW0VelwvKp3moDK4wVQlw+J5SFLtrNl0nKwSwykOG
	1GcgY5m+s2JeHn1SruZxaYQMD25K1H2XDCcwRxwx3brYdbqUCt9r6WHdTq4H92lfGmKtZeO4Vvk
	gMF1cpT0ZsvS8+8r1Msb/rZyiZcRSfiTvPM1mhqcrGv3FdD+/xCVBsoUQvwBOAiFy4Xl4UKYeT8
	S7zjTRib2i/M0dI8HM5QDdurXDtMSlHB9CEZ7ev9MqHb7ba6P6uDkuPxBgtpQBgHA/dmHRQ6RHt
	tiJN1PiK4K2HGeO/doKI1YWntRFMliZ7UJXioOSrNmQGUGd2GW1gnweSddCzRV3DsQPswpk=
X-Received: by 2002:a05:6830:44a2:b0:804:365a:bb82 with SMTP id 46e09a7af769-8450354b1bamr7559266a34.22.1792426552843;
        Mon, 19 Oct 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a05:6214:5683:b0:91b:81ee:a847 with SMTP id 6a1803df08f44-91bdf06366fmr143746986d6.30.1792426541314;
        Mon, 19 Oct 2026 09:15:41 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c6d2csm102278596d6.4.2026.10.19.09.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:15:39 -0700 (PDT)
Message-ID: <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 12:15:38 -0400
In-Reply-To: <as4gLo_6acb_zZu0@daedalus>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
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

On Tue, 2026-10-13 at 14:28 +0200, Jori Koolstra wrote:
> On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > The Maintainers Summit reached consensus to deprecate the Assiste=
d-by
> > > > > tag. Remove the documentation requiring it.
> > > > >=20
> > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > >=20
> > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > >=20
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > >=20
> > > and for those of us who don't know details about the discussion,
> > > how is it redundant?
> >=20
> > No, I mean I use an LLM constantly for almost all aspects of my
> > development work, in multiple dimensions, so if the old tag requirement
> > held, my email body template would just put "Assisted-by: LLM" in there
> > because at the very least, it drove the build and test stage. It was
> > redundant in the sense of "yeah, of course I used an LLM at some point
> > for this patch". ("This tag means nothing *from* me")
> >=20
> > > Do you assume that everyone now uses it (LLM), just as everyone
> > > uses an editor?
> >=20
> > I don't make that assumption, but I always held the position that the
> > tag was meaningless because it's the human wielding it that matters:
> > they either sent a good patch or a bad patch, and if it was mangled by
> > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to=
*
> > me")
>=20
> I think the tag did have a genuine purpose for a while. Now we have just
> decided to implicitly attach it to every new submitter (because
> basically that is the case.) The point was that a patch that was

I know plenty of people who would love to contribute to the kernel who
haven't before, who do not want to be involved or use LLM tools in
their own development. Considering how much LLMs lower the bar for
people to be able to submit fixes, I think it's also worth pointing out
that just because you've sent a patch doesn't mean you're a contributor
who is going to actually come back or is actually interested in trying
to get a patch to the finish line. I've even ran into 'contributors'
who wouldn't even avoid using an LLM to respond to review feedback
which makes it nearly impossible for them to actually retain any of the
critique they've received on their work.

> obviously LLM generated could be rejected for not carrying the tag, and
> a patch that carried the tag could be asked to explain further (if they
> had not done so.) Or at least, that is how I felt and have understood
> Greg, for instance :)
>=20
> Essentially, the way I read it, is that Linus said we don't need this
> roundabout way because we can just reject effortless LLM generated
> patches outright. This is good and an improvement.
>=20
> What do you think about requiring people to explain how they used an LLM
> for code generation? I don't care if someone uses it for review, or
> brainstorming, or whatever, and I have never understood the tag to be
> required for that. But if the code is LLM generated, it would be nice to
> know for instance what prompts you used. We should have some way to not
> devolve into the maze that Jonathan Corbet has sketched, where no one
> really knows what's going on.

Prompts aren't deterministic, and this also expects that everyone is
using LLMs (most of the contributors I work with do not actually use
LLMs, and most of the ones who do stop short of actually generating
code outside of large tree-wide changes with it). There are also
already drivers in the kernel which have adopted their own no-LLM
policies.

I have wanted better tagging for a while, because I do agree Assisted-
by: isn't great, but just going "well you can reject slop :)" makes it
dramatically more difficult for me to tell the difference between a new
contributor who just doesn't know how to structure their patches
correctly, and one that just let their LLM take the wheel and barely
understands what they sent to me.

Something that would be dramatically better, and I really hope would be
considered over the nuclear option of just dropping this patch:

Co-authored-by: LLM
Reported-by: LLM

>=20
> Best,
> Jori.
>=20
> >=20
> > -Kees
> >=20
> > -- Kees Cook

