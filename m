Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2D1E1E12
	for <workflows@vger.kernel.org>; Sat, 11 Jul 2026 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783736090; cv=pass; b=U8NmXXZPN4r51M9aF7XqQy21jzkANY8wrqyfXAUqrfJGVVmTgzqveH2t0R4z865Fji+vfKGT+SSTo16uxS4LChATNGOlpE4Ufr7oldXM2lbEvI0t1kvkoomqOX3pl3JeIavVHlSzwge3cwN6GoVogh0+HJzYjJpZLmhjvejCImI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783736090; c=relaxed/simple;
	bh=FrBzqvvpfoMK6y0mKSyWneI2m4CYwpCTAgS+X62gfi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7L4p67W25VT2LN7T9KXzXz9sP7UMAqAneCn6IgiG/3hIDvtUkrdxW8ePb+xqw9KCROMlStkwyyRs/bXQicSGm11NmV2dn96SVfgDXPy4MNgPso+5FqOKbQJ52/y3D65YKuWm0yda2PWQs3zvHM1UY9rRpVSPNLeONEGWgBwU+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnbbcyLS; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnbbcyLS"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c04bf4711so14106621cf.2
        for <workflows@vger.kernel.org>; Fri, 10 Jul 2026 19:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783736087; cv=none;
        d=google.com; s=arc-20260327;
        b=Qf+k3iIbyDYs8ASILPPO8iwye6n5ynQ+J3tP3awKSWZOhV186MSW6hPIW5LUw5c11t
         Gy+5WrvKuEhzE+ujnsPDn+txSEGZhY0qByRa9/WHiQdByJezFuZpdOBS3mIYRwU7SMUk
         e3Ip/jLkk+jJIQivTkDhNnJ2UDHP3ZpWELR4dU106KnCEWLiqm/IVIH5JAxid4GAXIdJ
         HCa/FQrtNAppDzrOKsHLMy3g46RIXPFOdXJXp9RqG1ymAIFqwmBW8dc9kCdSLBngRljR
         uQDFCFopKfGkHT5gvYwgXoAtA5jrEHEInA07IgY4XZ8xAEVLGOD2CyJzVsY1HiPufsBB
         qVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhfPzZLV5yhxCKhSH5aaGFL3mdzmDor2bbuA3Q3b6kY=;
        fh=dlxIlMUBr1QzVggMb8dJ/52dofZesxp1KUP8RDbYMcY=;
        b=TXMpQdsiPUIvP45P3El7pglYQWXyslYvTvMZT58EV/ImUIAQyfNml2z0m4cg3V/NCz
         uY5qBzaT4x6+I8GF/ERlCwzzspdiL8Kxm2Xb2fv6OmwV3J1DeTQ4cILm3AyfXojW+Dz1
         kRxKMCiWyzXTu/cL/CZO8tga85990lbBlkCZWruz1NDF+1f+DYqzq4w/xVMFuBauwGBc
         RtK7L6UEcC24ENArSQdJZVUF5rnZLB9pYa8KI+xXThzkQ7tHiPlFNz6iPgAJ+kfeyRL4
         wBfxTNeL4KCi03WQJybh56sjU3jmcOTgwU8JZcO3kIQtVoV39NFbSc9mUzgj2Ky2zK8n
         k34g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783736087; x=1784340887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhfPzZLV5yhxCKhSH5aaGFL3mdzmDor2bbuA3Q3b6kY=;
        b=CnbbcyLS8SkDMUBSFijObXOWcjllf3bab0nnbpIkV+yIUiTmGl5HHBJl7rwjz10taq
         zSaw2opdQ0JXansENwfbmgkRHMZkL05XoRqy+fO9GFFv5JAuSIjh8FY9j+QmEpMgvKya
         6pMYlwjuKrBVeH2NfQxsYlG20863MRFfhXwPtz0GTPI9sCZoS/NuQBx04Dpkuov5BD+o
         CL/8IMi56qhY2oNvZ4aMf8iuIDzABmLE5XikLVeBf3lSGk3INCeEb2EAqVovZlfH49GH
         MLlwRXUJE7mFEOD0iI8bQp6fNAKs/3dtjbCBeLI9Nd9js0ZZq/zhZV4roRPbSDymHqJr
         gtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783736087; x=1784340887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhfPzZLV5yhxCKhSH5aaGFL3mdzmDor2bbuA3Q3b6kY=;
        b=rOx+JxGvNKyd752plrlB8c4PyTLmxl2KdJH57s4CGJhFxgB8vPAo31USdDzAapO0fN
         TR4LOcOFTULCR3Cg5c5dYJm7tO8xuazhklz64Fw10BSCE+xnWYMQVW8Nc9UGDZ7o9UKA
         jmMQC/Qjb1W5daKHQsKSpaI4ysjFCd0+C4tW7gLGJ/nCSSd30A1l39ZeNnNd3NLCfCt9
         vaBmQnNJ+8q+olvuzk/1Bu797zhjN4/Ypi0m0Mj+qeIzwbyLfrfPuYtbxfPmD6A0CQ+j
         bWyBeEmqOfW8X5qQjLAIwgLN1aIGk5RLnKqvCRbMCvR5kUrj12nFfMOrUxzGJipFY2uZ
         y8NQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR5ftn9kruARrpI7zGAeuvKipvv76ZaVjcVJ2pBXWhuqp9XHX7sPquwTotIp+5Ok4Jdf8D+KV+7Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78f0kCKkXKtXtoqPb7z90455ctUj5WTTR4JC6u73O7uDZkaZc
	VnKP1lCDW0K6KGUo3eAF/xUMDYS5VzZznX5hJjJIGAn8GRthN/wAevDQwd01aozE/fLqyjeNb74
	fxWFPjelShCzVX0se1gsArfMhBs2zld0=
X-Gm-Gg: AfdE7cnwSWxYtiReTnUMwPwTFXx5jy8Qy+mcqJgpL798nzSFLVe9JxDJgETQUddwEZK
	qmdqbGgZpcxLNKgHZqUzKuEK0inZKAztzRS7HhKZRb9okRLUmq2if3ON8QKjI1qw+QfHyTSwZHQ
	XR4e+0sLa+/Ns1hmKA6t6xxUuYhg6HQ5/Ahp4tEQLrjbiWlBAjAEd0ZKhmVnrIVioyOivkU4Ws+
	ZvoXAm0d9uYlcN1RpuN0gCyFM1QCASIoDkkUmfpMtEfeh5NywuzZC6vBypbWrnk602QPDUg
X-Received: by 2002:a05:622a:1390:b0:51c:f8f:13e with SMTP id
 d75a77b69052e-51cbf243d11mr14867551cf.40.1783736087468; Fri, 10 Jul 2026
 19:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708092247.4188498-1-yuantan098@gmail.com> <2026070828-carried-extortion-789e@gregkh>
In-Reply-To: <2026070828-carried-extortion-789e@gregkh>
From: Yuan Tan <yuantan098@gmail.com>
Date: Fri, 10 Jul 2026 19:14:36 -0700
X-Gm-Features: AVVi8CeeSm2x2HB2RYTorhmqUX6nraUWur4McQiSyR0-fU2gppNNR_t3udJjEnE
Message-ID: <CAPuPA7Kdy_wghauOH5pggq+woLmtp4-BEyn8LoBJ2UhRExF+Xw@mail.gmail.com>
Subject: Re: [RFC] VEGA: a syzbot-like workflow for LLM-found kernel bugs
To: Greg KH <gregkh@linuxfoundation.org>, andrew@lunn.ch, 
	Paolo Abeni <pabeni@redhat.com>, laurent.pinchart@ideasonboard.com, hdanton@sina.com
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, jhs@mojatatu.com, 
	sven@narfation.org, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, Yuan Tan <yuantan098@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Thanks for the thoughtful feedback, and apologies for the delayed reply.

1. Regarding Paolo's question, a bit more context about who we are.

I first got involved in the kernel community during undergrad with
guidance from Zhangjin Wu <falcon@tinylab.org>.
I started building VEGA earlier this year while I was a PhD student at
UC Riverside. I recently dropout and start a company called Nebula
Security with my labmates. We want to help fix bugs in open source
software.

The volunteer bug-fixing group that mainly includes students from
Lanzhou University, where I did my undergraduate studies, and UC
Riverside.

I will be at NetDev as well. See you there :)


2. To answer Laurent's question: All bug reports are human-reviewed.
For the past four months, we have been including a human-written and
reviewed patch when reporting bugs, with LLMs used only as an
assistive tool. However, because the volume is large and there are
some bugs we do not know how to fix well, we would like to make some
bug reports public in the interest of transparency.


3. To Hillf's point: if we start sending reports, the initial volume
will stay well below that level.


4. Regarding Andrew's point: Early on, we used syzbot config for
scanning and validation, and that did lead us to spend time on code
paths and features that may not matter much in practice. We should
definitely prioritize fixing bugs in actively maintained code.


5. And to Greg's point:

On Wed, Jul 8, 2026 at 7:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 08, 2026 at 02:22:47AM -0700, Yuan Tan wrote:
> > Hi all,
> >
> > We would like to ask for feedback on a proposed workflow for reporting =
Linux
> > kernel bugs found by an LLM-assisted code auditing tool that we have
> > been developing since earlier this year.
> >
> > Since February, we have been developing an LLM-driven kernel code audit=
ing
> > tool called VEGA. It started as a side project, but the results became =
much
> > substantial than we expected: VEGA has found hundreds of valid bugs in =
Linux
> > kernel.
> >
> > That immediately created a practical problem: we do not want to dump a =
large
> > pile of bug reports onto mail lists and annoy the maintainers.
>
> True, which is why we all end up with long lists of issues/patches at
> the moment.  The initial reaction is "we need a dashboard for everyone
> to collab around!" like you did here, but I'd like to say this is not
> the best thing to do at all.
>
> syzbot can get away with a dashboard because someone is tending to it,
> triaging the "serious" bugs before they become public, and only letting
> the "would be nice to fix one day" type issues remain.  That's a huge
> resource commitment that Google has made here, and that's great, but I
> doubt that anyone else will have those resources to do this type of
> thing.
>
> Instead, let's just work to get these things fixed.  We all have
> hundreds of patches/reports in our internal systems right now,
> attempting to triage/rank/coordinate would just waste time.  In other
> words, just grind through them, send patches out, and get these fixed.
>
> I'm doing this now, and I know many others are as well.  We are all
> running "different" tools, and so we find different issues, so we can
> all just keep sending patches as we get them done.  It's going to take a
> lot of effort (I've somehow convinced 8 interns to help me out with this
> this summer), but once we get it done, we'll be much better off.

Yes, getting bugs fixed is the most important thing. The reason we
considered a syzbot-like workflow is that there are some validated
bugs which we currently do not know how to fix well ourselves. For
those cases we thought the community might have simpler ideas once the
report is made reproducible and concrete.

But we agree that any process around this should help move fixes
forward, not create another layer of overhead.

>
> > The first thing we tried was to fix as many as we could ourselves. We
> > started working with a group of student volunteers. Most of them are
> > college students, so we have been training them, reviewing their patche=
s,
> > and trying to build an internal review process before anything is sent =
to
> > the mailing list. The goal is to turn these findings into useful fixes,=
 and
> > also to help new contributors grow into people who can reduce maintaine=
r
> > workload instead of adding to it.
> >
> > The process was not perfect. Some patches were not good enough, and we =
also
> > made some mistakes early on when deciding what should be called a secur=
ity
> > issue.  Our internal review process has been improving with the help of=
 the
> > community.
>
> That's great, keep it up!
>
> > But the remaining queue is still too large for us to handle.
> >
> > Recently Jamal pointed out problems around our tags. That made me reali=
ze
> > that we should probably stop treating this as an ad-hoc patch effort an=
d
> > build something closer to syzbot: public, reproducible, trackable,
> > deduplicated, and useful to maintainers.
>
> Again, I think that effort is going to be larger than just getting the
> patches fixed and pushed out.  It also turns into a central
> point-of-failure, which is what we do not want to have at all for the
> kernel.
>
> But hey, I could be totally wrong.  Maybe some generous company that is
> involved in unleashing this hell on us would be so kind as to pony up to
> do the work to create this and help fix the issues that their tools are
> finding.  Just like Google did in the past, there is precedent, but for
> some reason people don't like learning from history...

We have also received some bug bounty rewards from Google, which gives
us some resources to put back into this effort.
We are prepared to invest more engineering time in fixing these bugs,
and we are also considering hiring engineers to help.

Will you also be attending NetDev in person? If so, perhaps we can chat the=
re :)

>
> It's going to be a long 18 months...
>
> greg k-h
