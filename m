Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6B264A86
	for <workflows@vger.kernel.org>; Sun, 12 Apr 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998623; cv=pass; b=lWPQKC6z4/1WnZeAJtT6L15jZ9EoAlEhle167uzCnofip+Ed1aXmJDKpkvlWKVZVpfr11bONSDhGArBcLT1tr2VZcQxSsIjxb5hn0FS/hyRR7bTV3aZJ6lvtZmq1Ax9AnknDH+OPWOjqeJG59k/kyMSYFFGglZ/AvzJi5UEXwKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998623; c=relaxed/simple;
	bh=qfPYmJHnxmRT9cVmnzYs/e4B/gEH62x/Gcw0W4+P+18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRxXL+0SaLhighbG2yM6rvZlVrj87R5DJV9RVBYvxMpB/raijLZq/Cr0PQRNC4cMh0OJy2s4bJrdHhtZE7/uobiEJ/5uiJCo+H4G9c49QnKDGQ7bXSLvUNNlH0u2iM5ZvarBUtLXXreVtzA3pMNbocQ3sbol+nfL8zASjOyRlN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkaSk7Ou; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkaSk7Ou"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8acae26e564so994356d6.2
        for <workflows@vger.kernel.org>; Sun, 12 Apr 2026 05:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775998621; cv=none;
        d=google.com; s=arc-20240605;
        b=IP5EbrKoAonk8EoIrJu5BInRqBZIvanZSB+BZiGsx8H8zwJZ1DPXhJIOE8g4GijImS
         2iKzGB6SIa9/30XNEgEspPupLLtmZQp81Ie8xSMrP457gnT1kmNGQGla54ZoA8/giDDR
         +qkEciPJRJAeqYHInIGZVl8OpegZKRdxVslihTVymIdEhmygy7TH2YKEFUwaLBUWxjSk
         puUTg4C8KgYlMRSGmp87NXepBoexq84GXfDNYJ7hVldNkjh0FFTO80hRpfVlHmsJXV4j
         iPrQS0UYawWLq825np0QBvF92IEfF2zZ0hpdKmwkU74IxThVSQ6HgluCwqL6804CwsD0
         JVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nB3JPzZ6SNvkIS006IVQjbVnUi19aOB/TCAFicSog9A=;
        fh=cQ+KmHdqE6I12JaZ8ZtCSm9KjSrKZoY7ghh+SgkPw8g=;
        b=KGQnI4fPDP5o/rrtSdlgT9A6sVoQNeCj+FQT8vP8NqX8RsMe2OtNM40NvbhU6Lac2O
         CGKY1LyngTGHgHnUgL25OtL9L8ZSlPz9B7xZ0P3oP0J/XNphP5vw1fl0Lw/21O1glY5F
         nU6Yv4nMqXLGRu5brhYYUSmzmG66hISmFhanXXVlqA2K2woU+ePdKjINZwRtX4/3KERB
         e0f0gD71v6NWCAPWeB42LMRtzzGMXqan/Cv8F+WV+6LdsRjPLGxyHGALn051iFE6e+6s
         lb3+GQ7CdEwJh0UF4ka8Mrg8cKjTBWvpASW8chgX3X3Xbx8tHTRxWgadkD7WbtH0YoAn
         b/WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998621; x=1776603421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB3JPzZ6SNvkIS006IVQjbVnUi19aOB/TCAFicSog9A=;
        b=JkaSk7OuU5V+5LiaR6nvJ2eOkJU+OnNuHRudi2M+ggaVIpLl1+tQPkRgRyBmdvKNtJ
         q7631Z4SsgbOwwWpLTy5Iv6szb2loRiDr34BX4dQXfeG/YyxJ5PeiaP6s2862tpU2mXt
         zr8CybNMMA2KFhKcwrAQBGo8yPe0oAc7JkNvKX2lt/yo3QzXJlkiwYEwAvvcnoOsMe9z
         wm/DFi62LK+CNmgKoea41Y1v81F1BggxQXUkZHah/90ephJ0guRyfnvl6W5pRx1nNNLC
         QBLFBfFbulR/aYcRwJxG+nWVW0mM5jwwP7J24+d097gErfM9M7uiwLlEPJwJsJVGCgOY
         yGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998621; x=1776603421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nB3JPzZ6SNvkIS006IVQjbVnUi19aOB/TCAFicSog9A=;
        b=lAvyRrmkgOJCfnEltr02uFptcsq0jsRL0Qe9vqPtnYyf9zzsK7VKAKc00eNGgaGx+Q
         vgfCEw/Bpe51zGF10pcYpedCvqUC0k3RC/EyWXbPswZW+RT0A9tuDub2JXh4sNGzjKyF
         WmpaARSXStPMfrNnyt0UxCW928Nq8HBnUxuzv3UOCVixQi1yhcRSQSOnO5p01Ukl35Nj
         T2BHKVLq+dpBssiZqMFvwTKvELGhF7k98pL7LRqTnvmCGeSRDonov2gWixml203dh0oa
         VnueiAOoeBFp0WQBaZspt+mkaSF+ttnZPm+P2igJXkcNiwc1IlSKKvzlRZOw/q+WHRNb
         3dpw==
X-Forwarded-Encrypted: i=1; AFNElJ877mS6tXgvddLKuanwlAAGDoby2VEPEjKqRzabQHkp67Bde+e2ANEzC/eyfIbBwO9hd/I/YKi84CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTymyFmpJbDnV/38qb6mBspDsR2s1LL1E6m3ThPRIEieaizjQ
	mKmicAuPv0CUWVe/0nJSHEzAy/G2S0A17RAlHcJZwfHhRE+Q/PN+Ekl+RLrMGuoppz7PfbOmS0o
	mQwvcLrT06kHwbGAVKRdVKQZHZYPE+C0=
X-Gm-Gg: AeBDieuWjWkRFwRDg3Omusb32CaG6OHWEulYMfOGWjtJK54VyS01NsN24rXxD/Oh1aU
	vjhqXwnUxTkLPvK3r64rLT6t2liJGgj0CDn91teYcWIXtV4Ng8PK2CKzIiPaS3rlJtF03zPnP1p
	414Enf4i4YdxQhES1uZL3Ckdm1yMvCzgTdky8VoYu9dmiyBmwHa2t6Ui+zcKc99dCAU0VgWF5My
	oH5MHedvwobV8PDIMfsh6WtXYVsRmTPrJuys+pYYeFp55RCrgP8cN7XNT3RjuTnvcX79UYSyg9O
	2tJ9fUE=
X-Received: by 2002:ad4:4ea1:0:b0:8a0:44bd:57d8 with SMTP id
 6a1803df08f44-8ac8623d429mr167289366d6.50.1775998621324; Sun, 12 Apr 2026
 05:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410145448.38253e3c@kernel.org> <20260410221220.1708137-1-kuniyu@google.com>
 <4f5810a7-c792-4d6b-9f7c-6c6b289def19@blemings.org> <2026041135-shindig-trekker-5d06@gregkh>
 <b9355e3c-9252-4dd7-b7ed-dff13e3b2c8b@blemings.org> <2026041124-hyphen-circulate-34ae@gregkh>
 <3cd91fbc-d3a9-431e-b915-58e851c7df9f@blemings.org>
In-Reply-To: <3cd91fbc-d3a9-431e-b915-58e851c7df9f@blemings.org>
From: Chris Maness <christopher.maness@gmail.com>
Date: Sun, 12 Apr 2026 05:56:50 -0700
X-Gm-Features: AQROBzDu5TKgVs83Z1LWXJRlNPDBrABRy3VOJf1yI4YJC2vIIt_n8WeMz8OO5kU
Message-ID: <CANnsUMFVg9nZnJ_He38O9Ui1YUM_Je7MGO-y_J+oW=TG3jV1bA@mail.gmail.com>
Subject: Re: [PATCH net] netrom: do some basic forms of validation on incoming frames
To: hugh@blemings.id.au
Cc: Greg KH <gregkh@linuxfoundation.org>, Kuniyuki Iwashima <kuniyu@google.com>, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@kernel.org, 
	workflows@vger.kernel.org, yizhe@darknavy.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your work, Hugh.

-73 de Chris KQ6UP

On Sat, Apr 11, 2026 at 7:33=E2=80=AFPM Hugh Blemings <hugh@blemings.org> w=
rote:
>
>
> On 11/4/2026 18:58, Greg KH wrote:
> > On Sat, Apr 11, 2026 at 05:24:17PM +1000, Hugh Blemings wrote:
> >> On 11/4/2026 15:50, Greg KH wrote:
> >>> On Sat, Apr 11, 2026 at 08:25:19AM +1000, Hugh Blemings wrote:
> >>>> On 11/4/2026 08:11, Kuniyuki Iwashima wrote:
> >>>>> From: Jakub Kicinski <kuba@kernel.org>
> >>>>> Date: Fri, 10 Apr 2026 14:54:48 -0700
> >>>>>> On Fri, 10 Apr 2026 14:30:42 -0700 Jakub Kicinski wrote:
> >>>>>>> On Fri, 10 Apr 2026 07:24:36 +0200 Greg Kroah-Hartman wrote:
> >>>>>>>> On Thu, Apr 09, 2026 at 08:32:35PM -0700, Jakub Kicinski wrote:
> >>>>>>>>> Or for simplicity we could also be testing against skb_headlen(=
)
> >>>>>>>>> since we don't expect any legit non-linear frames here? Dunno.
> >>>>>>>> I'll be glad to change this either way, your call.  Given that t=
his is
> >>>>>>>> an obsolete protocol that seems to only be a target for drive-by=
 fuzzers
> >>>>>>>> to attack, whatever the simplest thing to do to quiet them up I'=
ll be
> >>>>>>>> glad to implement.
> >>>>>>>>
> >>>>>>>> Or can we just delete this stuff entirely?  :)
> >>>>>>> Yes.
> >>>>>>>
> >>>>>>> My thinking is to delete hamradio, nfc, atm, caif.. [more to come=
]
> >>>>>>> Create GH repos which provide them as OOT modules.
> >>>>>>> Hopefully we can convince any existing users to switch to that.
> >>>>>>>
> >>>>>>> The only thing stopping me is the concern that this is just the s=
oftest
> >>>>>>> target and the LLMs will find something else to focus on which we=
 can't
> >>>>>>> delete. I suspect any PCIe driver can be flooded with "aren't you
> >>>>>>> trusting the HW to provide valid responses here?" bullshit.
> >>>>>>>
> >>>>>>> But hey, let's try. I'll post a patch nuking all of hamradio late=
r
> >>>>>>> today.
> >>>>>> Well, either we "expunge" this code to OOT repos, or we mark it
> >>>>>> as broken and tell everyone that we don't take security fixes
> >>>>>> for anything that depends on BROKEN. I'd personally rather expunge=
.
> >>>>> +1 for "expunge" to prevent LLM-based patch flood.
> >>>>>
> >>>>> IIRC, we did that recently for one driver only used by OpenWRT ?
> >>>>>
> >>>>>
> >>>> If the main concern here is ongoing maintenance of these Ham Radio r=
elated
> >>>> protocols/drivers, can we pause for a moment on anything as dramatic=
 as
> >>>> removing from the tree entirely ?
> >>> Sure, but:
> >>>
> >>>> There is a good cohort of capable kernel folks that either are or we=
re ham
> >>>> radio operators who I believe, upon realising that things have got t=
o this
> >>>> point, will be happy to redouble efforts to ensure this code maintai=
ned and
> >>>> tested to a satisfactory standard.
> >>> We need this code to be maintained, because as is being shown, there =
are
> >>> reported problems with it that will affect these devices/networks tha=
t
> >>> you all are using.  So all we need is a maintainer for this to be abl=
e
> >>> to take reports that we get and fix things up as needed.  I know you
> >>> have that experience, want to come back to kernel development, we've
> >>> missed you :)
> >> That's most kind Greg, thank you, have missed all you cool kids too :)
> >>
> >> More seriously though - I'd be up for doing it, but I think there may =
be
> >> others better placed than I who haven't yet realised we have this conu=
ndrum.
> >> I'm nudging a few folks offline on this front.
> > The main "conundrum" is, is that this protocol completly trusts the
> > hardware to give the kernel the "correct" data.  So if you trust the
> > hardware to work properly, it will be fine, but as the fuzzing tools ar=
e
> > finding, if the data from the hardware modems is a bit out-of-spec,
> > "bad" things can happen.
> >
> > I don't know how well controlled the data is from these devices, if it'=
s
> > just a "pass through" from what they get off the "wire" or if the
> > devices always ensure the protocol packets are sane before passing them
> > off to the kernel.  That's going to be something you all with the
> > hardware is going to have to determine in order to keep this a working
> > system over time.  Especially given that this is a wireless protcol
> > where you "have" to trust the remote end.
>
> Thanks for the thoughts Greg - and ya, I guess on balance I come back to
> being generally skeptical of both hardware and software to Do The Right
> Thing (TM)
>
> So bounds checking and the like seems prudent irrespective of whether
> the kernel is getting the data from real hardware, software modems etc.
>
> I've done some initial digging around that confirms my suspicion that
> this in kernel code remains quite widely used, if somewhat out of view.
> Accordingly I lean then towards working to get these various mitigations
> in place with some revised patches etc. as needed and into the main tree.
>
> Once this done I think that'll give me a good sense of whether I or
> someone else is well positioned to keep the code maintained longer term
> and thus justify it remaining in tree or not.
>
> More to follow once I finish remembering this kernel thing!
>
> Cheers,
> Hugh
>
>
>
>


--=20
Thanks,
Chris Maness
