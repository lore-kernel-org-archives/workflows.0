Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C8F263C9F
	for <workflows@vger.kernel.org>; Fri,  9 Jan 2026 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767937383; cv=none; b=kmbBwc3rcigJZ/5VpG9flcg0KYOFGCjoguKvrFGEKhgDk6J8L8XntJHnmKOxRS/uAmEod/Mcgvjk4d05cTeuUpxxhWK1jWSspw5hSIH7834Q9/lFho5cO/dl0hf2jWhOlU/pC2ov+WYpos3QAypbIMaOfPlXDP6xujxeNE+ynPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767937383; c=relaxed/simple;
	bh=lyOk/1M5pzUzuzEJIZ+qNtV8QTN4iICp9NKhm4PSg5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9Chhsub73DkPAhJ0ThxAFTEcSgCvS6d8ZMl0M0EjezAEuT5/j2NcWdQBCryuFpg+OmYibGb2DfuFr91G9oSoXCVU7TYn1whvvmutm+rxSw+fGfayyPW5avXOIvPZDIXS3dvT79kgqwPPnUBgJuTHLQX++jt8Djx0RvcyRuj1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjs9GyPK; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjs9GyPK"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4775ae77516so42959175e9.1
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 21:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767937381; x=1768542181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDsg1uOh4nHyxX9yWUni96h7XzFm6nGUN8LTejyh0mg=;
        b=hjs9GyPKtrT/C6nXdSQ5+KWEw5oxH4lsMVsZGt1jtOQ4QTdb500H6g/zKwroox7weZ
         k73YyRppnrQaT7z95oDsXu7arwPsZRUqw1vEsdwfzqFXZcyoPxwW0DaqAdPv/txLm19T
         osj+Y8F1od65zLC9l5EVKk16AtyOu853b8m3kGbp61XtoNzPNG/vuL58x/kADdx4eKED
         gx5BqESLekGYlkkCB3ErRcCpNpSwv5SM3ImpfMnzrZEXhOGhr8DhF8cGqG3yvCVsJ32A
         xRZ9j6p3kZJ3EzECnpK7Ca/cZ2cOhe3aiJnH90kWd98fBPv8SlLKWIHVKZ7CNGOIn0+U
         jSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767937381; x=1768542181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDsg1uOh4nHyxX9yWUni96h7XzFm6nGUN8LTejyh0mg=;
        b=ApBmMNoaOly73Qs68yyKzHWADLvmvBdCIrs8BBV8ayqQ6WsTTWou1220IptsPwu7cY
         TT17DcFmY+1rpml4EcwS2gNAMVIFLai9t0iOgX4SFy/swKrcErFJYFvbkF4YGGshadBW
         u/Q/zUgCBVNruHCTD/GkUMP0iOYltQVx7XZXoNR1ML8BEtUhBqT1DTZfeev4zQEMxUTS
         mevaBcA7RICvBVC0DUPOKkL7hYNTR1z8JXGQjpX39sxs+7OJRpsQmjsvzExfLKmW3jL3
         QvU1/KO/ARRa1uUUqf3pz9BocK6k1k/DKuzx+bJEcjWzGOSmTps1udpeunE5stEhD0Bx
         nfbg==
X-Forwarded-Encrypted: i=1; AJvYcCUdhjkelOTvRECM8K5hfVL/oG1omXwiXzH0diKL0XJwuq8I7W1CqLa0tBaJ26/tQvH7hpDI+taKAbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvs6XNMBXWvG6bwRZx8OojaJoRV5zs9gjH+R27tjkDCfLF2hlA
	oTprndcEhRDheS++C/Ge0+vI/BjyCNU/K5DTVvQoTUad245TIXWfZhXVq+uAVjoT72s=
X-Gm-Gg: AY/fxX42fHjbLU9ufm1hlV8q8L7r3yEBaRbroeYO+BgcvX+DW+VYrKAXEw968/91iRN
	F88LCoC7F8rZrL9Ztq3Wg4keCNBtj5CA4JpdvY49w3znEz4YCDIfC1ddBMKENvw2cyQdlU3stYl
	yfgYwzhYPnXW8y1JjUgi6NqEh7Stp/fAuk/ro//YXdrZ0ThDa61i6r6iwourjoE8bod3Ogejsge
	wBYp2BcI4YzZbAjIEHK/KVhnJTxra29KY0/3P4FZTLkxxQTN8kyZq+l3oW81b2YJzKhLzkVT74c
	a8nkPaqhfkzple4q7bAGeRex8IeChmzIoTcV6T7gO39OFHJ0BCbGLDfa3GWtEkSvfQ2SQzkmW+w
	4DYMu1kY2yP8VGF5QgzNFtn/QUEurhHfHMHKMFrT/qPa1o6WkCMrSaIKSFiwimKQkFiPnSPGZ4O
	85bYzvwCYTwL7H8fIm
X-Google-Smtp-Source: AGHT+IFtRqdtvSZtFdYNMvAAEbXBJ9dvS7lUHvIH+DVKEKI5EhL27ZqtmfMN3VJprnKU2dkiBMjC9g==
X-Received: by 2002:a5d:5d05:0:b0:430:8583:d19e with SMTP id ffacd0b85a97d-432c374f4f4mr7932200f8f.8.1767937380338;
        Thu, 08 Jan 2026 21:43:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm20503335f8f.43.2026.01.08.21.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:42:59 -0800 (PST)
Date: Fri, 9 Jan 2026 08:42:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave@sr71.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWCVYLuUFZrsbfd-@stanley.mountain>
References: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108151437.3188cd53@gandalf.local.home>

On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> On Thu, 8 Jan 2026 11:50:29 -0800
> Dave Hansen <dave@sr71.net> wrote:
> 
> > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > I'm also not sure why we're losing the scrutiny part?
> > > 
> > > Something like:
> > > 
> > > +If tools permit you to generate series entirely automatically, expect
> > > +additional scrutiny.  
> > 
> > The reason I resisted integrating this is it tries to draw too specific
> > a line in the sand. Someone could rightfully read that and say they
> > don't expect additional scrutiny because the entire series was not
> > automatically generated.
> > 
> > What I want to say is: the more automation your tool provides, the more
> > scrutiny you get. Maybe:
> > 
> > 	Expect increasing amounts of maintainer scrutiny on
> > 	contributions that were increasingly generated by tooling.
> 
> Honestly that just sounds "grumpy" to me ;-)
> 
> How about something like:
> 
> 	All tooling is prone to make mistakes that differ from mistakes
> 	generated by humans. A maintainer may push back harder on
> 	submissions that were entirely or partially generated by tooling
> 	and expect the submitter to demonstrate that even the generated
> 	code was verified to be accurate.
> 
> -- Steve

It's better to have a grumpy document, instead of grumpy emails.  We
need it to sound grumpy and it needs to be the first paragraph.

AI Slop:  AI can generate a ton of patches automatically which creates a
burden on the upstream maintainers.  The maintainers need to review
every line of every patch and they expect the submitters to demonstrate
that even the generated code was verified to be accurate.  If you are
unsure of whether a patch is appropriate then do not send it.  NO AI
SLOP!

Of course, sensible people don't need to be told this stuff, but there
are well intentioned people who need it explained.

regards,
dan carpenter

