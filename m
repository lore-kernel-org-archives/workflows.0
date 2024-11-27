Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A9F1DFD1
	for <workflows@vger.kernel.org>; Wed, 27 Nov 2024 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718896; cv=none; b=LDBG+0Iv7PP934vLqXvrcTSsQe7Q4aSc/TrYtsYOtRoRAdx5TamFcg+R9YqO0bvvwxhWic1khCDHMFJhsQtMC6zf/+Q7gPoloN0Sdh7M/zHxujL3pxlbN7LM1FlN8wevjgpsys0ehKaEcXOqyFGDq57YNLjD/mxfZz0ftZu7yYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718896; c=relaxed/simple;
	bh=lZTO1F+K5JmRsqZrFtPyEBylUox52Bl3E5P9xltjypk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pooIkt6kqb3kFdpTGEjPyhBBEScB49d7BSnub10oQYOF9ay3Tl0b2CecsHjsuG4GdHvhFYON8BSak0m390gvfrNFfiJTEKAnr55d54ynSIyz7LnFBK9Rmef8S4mQtScsM4J3qWG6F5vfohiOkkFTRhDJexcf5O5r86E8P1JSsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hzGOFEku; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hzGOFEku"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434aabd688fso4899425e9.3
        for <workflows@vger.kernel.org>; Wed, 27 Nov 2024 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1732718893; x=1733323693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zGdCUwsG3IsDqM/i2oWhWlJlnjPcZGvagoXb4ToDno=;
        b=hzGOFEku2MLtF7coVJyOe3/cy55Cc/PYkQM1j8i6OxW9evM1zwnX1AXr9RSB9lNRIl
         EnD8ZF3l/6JR7TfAgYzmUYj4dj2Q4SK/ydPbt0CpWzNB4XodtxfAj09s/dAoeLeOVnF5
         Sp4VRI98omRTuDIhG+t/cDNbGJ+I8ks/R4NR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718893; x=1733323693;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zGdCUwsG3IsDqM/i2oWhWlJlnjPcZGvagoXb4ToDno=;
        b=SCVG1Qs9qRT4VhpVSg1v9sUMM0DAwXrk0xuoDg/eoEZ7hw2rqUZWApDdibKUTgFuNw
         N5oaiaqdAWCILOElq1I9GYLN/EiKlB8pN368unlAyDzJ6iM+acAmUrqORkUi6Pf6hE6L
         F2aYXcP0f637erjcnZOwHOMLG0LSRvTw2FyZwwVZkyvQFzvCyROTch1UFYyYjwHqPm9M
         J2t1Zfg2y81Bo31K1Y24V+5ySdX1EBmQ0e0fRX1QPfTNMxEJ2IgXCvvHWGHTWmx6q4RC
         UZ9uZSS+OoPH40Dc1t42uZPJBWbgTd1fGHXKQnKPA0FrZXx/8j0196odG8b89q+Q86Jm
         4wRA==
X-Forwarded-Encrypted: i=1; AJvYcCWXFF+BRFmvk77HxWh9WVYZQnelnVKMpRMVMi5nz6bj1pPVzckHynqCGzwdaBv3GvNVJyzEl8nhqpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqeAZt4lXSNMI6uqV3qDp95yCFMtJa+6ZgWuEOVUsjsVmF0zMu
	jtrcTi2VgJ1uolMbjWW+wq8DK+tEbFmuKEUTSKJN0iullHoHeYHUFnqg7WbXARk=
X-Gm-Gg: ASbGncvV9zpcrbk7SvYtGtVd6YW0k4l1xCwQB1TYeRFvvKKC7bw6J4QwBZneADrKztF
	kBjPw+5kngNFk36oKNnZQCZRInwJuxQ3C9PV1m0lC4oaKZ8ykV8RGK5dJ+6HiqztEDf8ykZeTq4
	1mlmUiMPAAl+Whv6UzQg8lZysvVQxo8da3FeZ6kdCrh4gKYpORIGWZx7qftPXvQ9HrYG+fVBOe5
	REBs5aUtt50vPxQqjZZums78jgLktBJWkS+EJdX3ZQ+FNfV85bihGWPVQqOng==
X-Google-Smtp-Source: AGHT+IG6ksNzlO1Mw898FVD0TgVtTxvVHhve8jTB516NcfNmw2tP0Lluyr6vcK94J/lDcM1jpoRB/g==
X-Received: by 2002:a05:600c:4708:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-434a9dcffa3mr36410165e9.17.1732718892925;
        Wed, 27 Nov 2024 06:48:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e2922sm23014835e9.29.2024.11.27.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:48:12 -0800 (PST)
Date: Wed, 27 Nov 2024 15:48:10 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
 <20241127111901.GG31095@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127111901.GG31095@pendragon.ideasonboard.com>

Jumping in the middle here with some clarifications.

On Wed, 27 Nov 2024 at 12:19, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:
> > It is somewhat similar to drm-intel and drm-xe, where reviews are part
> > of the acceptance criteria to become committers.
>
> Those are corporate trees, so it's easier to set such rules.

Imo it's the other way round, because it's corporate you need stricter
rules and spell them all out clearly - managers just love to apply
pressure on their engineers too much otherwise "because it's our own
tree". Totally forgetting that it's still part of the overall upstream,
and that they don't own upstream.

So that's why the corporate trees are stricter than drm-misc, but the
goals are still exactly the same:

- peer review is required in a tit-for-tat market, but not more.

- committers push their own stuff, that's all. Senior committers often
  also push other people's work, like for smaller work they just reviewed
  or of people they mentor, but it's not required at all.

- maintainership duties, like sending around pr, making sure patches dont
  get lost and things like that, is separate from commit rights. In my
  opinion, if you tie commit rights to maintainership you're doing
  something else than drm and I'd more call it a group maintainership
  model, not a commit rights model for landing patches.

Anyway just figured I'll clarify what we do over at drm. I haven't looked
at all the details of this proposal here and the already lengthy
discussion, plus it's really not on me to chime in since I'm not involved.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
