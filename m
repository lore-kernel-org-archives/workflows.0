Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF720241CB7
	for <workflows@vger.kernel.org>; Fri,  9 Jan 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767936607; cv=none; b=tZAysYWkq+kJekr1Zou9cHDKfGXPf4xta2jClxRVU7AYVYIMw1xjGJ1Si7mAVjkwV2M1toq1MQKe6NOAR0m5DuYl7oKGYgehflMnKRWJ2m7xSYU807keaNQ0CiKHD0T0Wo5OfCXMTDn7RgJJx2lOVtBK9b9kQ616i8KzD74WSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767936607; c=relaxed/simple;
	bh=Mj47l2IWaLTs3NXZwkFO1trSpIzaJNyUM0yVwg7oMdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeLigkbaVXbOVLFBMGVcgHHcVFvOHmvBFOfcVNbSAFLxGAiv2+MiKIlcQPFYr+NJ1VILNAdCowW5K0MWIxv21YdvwSpdc+O3PCesCDXvCTt1xuV9zWG/TXyBEJ5PoCMOrkmUOIGu/Voxrnj721IMnwqEZN01E+uC8KBzFQGodDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTxSxBpH; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTxSxBpH"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2000066f8f.0
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767936603; x=1768541403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlX/wTrZuwZGU18danwT6gBtV0nfe5EttE7RqttuQsY=;
        b=FTxSxBpHy86oemidf9HvMAMQgi8oMUdPlKmbwM65m74kSlzquMqNFsH1U3ZXxYRs1e
         7vDC6kl/lzMFG7wlJePssGVJmCAmzxRvPLLS6cp90Qw0t4S8UPoHVLQ3Mrsrg6tJ+75/
         0bIny6Y6cKHoMMxi84qj6/qABSiHr5mQhnc12EeHffk0p5tQ6/p3OytvOa0YQRJ9ilrZ
         dYNk5Eaj8h0GA1CQXv4ehXqGodagmH7c57za23YR01T0U7KsUKEGbWIxwwuOQqyxiTY+
         uIFXOEI5m8KjYmHp+uR3SOjeHW+1fzf5LO1nY2uJym11xwk1CmncNOLQeM9ydg8D8I45
         0gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767936603; x=1768541403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlX/wTrZuwZGU18danwT6gBtV0nfe5EttE7RqttuQsY=;
        b=LTPnYdmyfGYkAMPkV8w0LL+CEu3ZrJVOr5dKL5Z8/rgoho/ITawDckUVRPdEZT1zmR
         DPeH3vl4gmWFQ46Gi5bVl+b5Qpr48iqS1YJI6v4NP26j6mfen99ytUWu5f1n7+ec6Au3
         iHE0cWhFBgMwMu5pB6JGqg2dvkjuEFtQ1kfYOL/dVlSiOoITyZKCYs7ZvlYBLTU/UugH
         Y+66CcwOj0yPywwznmKxki2Fq/YjlqFhQvWdfdXdcq0KzTQtAAxoF4CkTbDznFRrz650
         DnlsRGVE4dYBpFXuGV66kFMJc3F+rh1R5N5DWsil6Fr/W6jIujm1gMYBdOGzNBdYxXrL
         iwGw==
X-Forwarded-Encrypted: i=1; AJvYcCXmTbKyCkRBDOxcl9exWGcZndy8+FTGE17f0ug1AWyyhX7tvJJh8DquoGpNoXCXDukBFNaHWStLl3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfFJUz72ZQh6YinV6DjvfiuJ1TRexNR380DcvDg+rqTGa+Iath
	Jd4+1G32SKKY2PUD7m43TkPWOWChoDUbIRxjz2298uKBdERNZt7LEUHyCYyObvxvAM4=
X-Gm-Gg: AY/fxX6MtlSR50S1YhuvmRaLZdLMpNsE1Wk2tDQzfTzrPhpq2kvltrlFnWLUihED/nn
	aQauZSq2xRDE8SB9YpHTgmtyE0oTsRzLlAtNLM/fu7AhkXFDZKeS1gmEywQG2S8aVabWDvg9HMQ
	AKfTNOwSCEREcLrrUA8Lq298BkNTjLAcr1migUowrribaP7m3chQB+l3XtyI+Bd/j/GEs3RW/5K
	PXuKzYSnTs/mWQFL/S/T3obYcw9XhRDlObcF7HjS8srddUNcZQbENQQguVKT7KNmbiXS+fh1r1Y
	vCpz1Aqhsp1MBuOhQNflih6qGPlbcouw7ckh2tNBusT5W8OT549WoNOSi6Eifyg8C07w8fF2gAy
	flg80gJK3QJpOWnOVHSRD484+PqxlX9RbvyX3A6csxEtC4b77DakW0/asVVrklVyDLBIJ5vf3Ys
	35XG4TGEjUYQnf2+4o
X-Google-Smtp-Source: AGHT+IHIW77tCUXow8tCSksG255U7b5IhL2YGp4Ww34P0AxeIqcK/+U1jAbAWDroMjoW0u39lfdU1g==
X-Received: by 2002:a05:6000:3104:b0:430:fdb8:850c with SMTP id ffacd0b85a97d-432c37c380cmr9852754f8f.61.1767936602927;
        Thu, 08 Jan 2026 21:30:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm20339833f8f.19.2026.01.08.21.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:30:02 -0800 (PST)
Date: Fri, 9 Jan 2026 08:29:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWCSVh6NocePMvp8@stanley.mountain>
References: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>

On Thu, Jan 08, 2026 at 04:04:39PM -0500, Liam R. Howlett wrote:
> * Jens Axboe <axboe@kernel.dk> [260108 15:54]:
> > On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
> > >> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
> > >>   - Ask the submitter to explain in more detail about the contribution
> > >>     so that the maintainer can feel comfortable that the submitter fully
> > >>     understands how the code works.
> > >> +
> > >> +Finally, always be prepared for tooling that produces incorrect or
> > >> +inappropriate content. Make sure you understand and to be able to
> > >> +defend everything you submit. If you are unable to do so, maintainers
> > >> +may choose to reject your series outright.
> > >>
> > > 
> > > I feel like this formulation waters it down so much as to lose the emphasis
> > > which was the entire point of it.
> > > 
> > > I'm also not sure why we're losing the scrutiny part?
> > > 
> > > Something like:
> > > 
> > > +If tools permit you to generate series entirely automatically, expect
> > > +additional scrutiny.
> > > +
> > > +As with the output of any tooling, the result maybe incorrect or
> > > +inappropriate, so you are expected to understand and to be able to defend
> > > +everything you submit. If you are unable to do so, maintainers may choose
> > > +to reject your series outright.
> > 
> > Eh, why not some variant of:
> > 
> > "If you are unable to do so, then don't submit the resulting changes."
> > 
> > Talking only for myself, I have ZERO interest in receiving code from
> > someone that doesn't even understand what it does. And it'd be better to
> > NOT waste my or anyone elses time if that's the level of the submission.
> 
> Yes, agreed.
> 

Yeah.  Me too.

> If I cannot understand it and the author is clueless about the patch,
> then I'm going to be way more grumpy than the wording of that statement.
> 
> I'd assume the submitter would just get the ai to answer it anyways
> since that's fitting with the level of the submission.

Yes.  That has happened to me.  I asked the submitter how do you know
this is true? And the v2 had a long AI generated explanation which quoted
a spec from an AI hallucination.

I like Dave's document but the first paragraph should be to not send AI
slop.

regards,
dan carpenter

