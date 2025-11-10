Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F030216A
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803382; cv=none; b=JjmBz5s3fTdKjJn95e5SB+Sk9uzEybKDyVkuwU8zVYDJEyttK2QIvVp3LpEf43haxBtDagcuMyThY1qyLDi6jO4jQ7Ic0bB8uR5q8wyV9nYaKrzr9Bl/EFy8cHtfTIIh76BnSlKiY2zhpY5/osgeiB/BPelZJxIKju8CCjA6UQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803382; c=relaxed/simple;
	bh=PxpwsZjpe3I2aDg2u+M53UXL2FPgJLtktslzgZjb2us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQZVbSMDt2gQp3nqcN2uKf9q0VhT7hraqZIjGLgEvU6R0K9LvyY6ipmLw8Xyo5bdQTWPpHu/uDaxGwHQiVCXaE6EF+Hy2n4Y9hbRoKIAXsg/knoLHJnZyjA5oHGTCbxRvGvvLP3G8bazSLay0TLDtFmtu3PZVMsIpUKd9KuhOBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c6QhjxEZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c6QhjxEZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640f4b6836bso6308795a12.3
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 11:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762803378; x=1763408178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99/bEi2ImdlU2nnSwwuvCx8UfBwiGJABIRJHpSWJmF8=;
        b=c6QhjxEZrAzgd6MEYt2/m6ELXncoJeZRxYVs7OdFnyoG5F4/ZmNuBWj5cuDkmEdZa9
         JaTsx6MPZfDShG/SfhZmEs4wWq65Io9RQ1fisQaFHu3DdkrgSFuZFWuYW4zOwdFYWPYG
         nlenlfcZLD0mxbBrghLO+jxxvD2UctxVwD1q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803378; x=1763408178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99/bEi2ImdlU2nnSwwuvCx8UfBwiGJABIRJHpSWJmF8=;
        b=l9ptEHJS6ta5qWgiDzSknFVQi0eTw5PR592dQJE2Kna3Sj0ijJebGCM+2F1W6zA9fn
         2LJUwSVANUetlhbLeicIOjka29yXwjWc1BkKrhwFNy5sr6fWruXz33L8nNnrrCDePzns
         Qfieb7+b97Ucme5FwGPvWvqvoOA346UkTIoPxHdGUTTRbYqIilnDUpceZ505yUnevDcw
         CoJHl+wplDhpf5igZ4BD+ot7lNowDKsDHdg73T29aNlwtZGpqlH/gozWa5twhWG4Qo3J
         /UPny6EEVPulHAH6m55zkjAebCVFibj2dsDDijl3xJ72yZLqgeSOD3ccuFAJMKGXEqeW
         Hk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcWktr70i4TC+Rt5rW8lgGWKxElHrKyhvUAfOucj0+GcDUyCbYP3TUKgsWYPxo4WW33L5vKJkF3XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx858xZpjavA6ggEfOC1gVpjABqbKpoTjfFGEs5R4QSJTnaPsr5
	25DqVZxgQCPIcI8Pz0z5cx+qygKzQWMV7GH4FQW+Bx+Wr0c/aQzUi6aypIPAf2DMK7cBaxb5vEH
	s5ftXvwA=
X-Gm-Gg: ASbGnctl/Sut0vFpLtiLvoEZzQ4KsLtCsiBDHLb2ikSHTqEJI2v6DJCndj6yT9nyl72
	ySKA33gaWHtJ3wizCCOobx4aHd55MwvTmI2TzVI2A2lUWRy+fWbeD6D0WCUCxvFHvlmz07dSdiW
	BnKQXPNE5khCcnmhCn44gB1KKEFM6eKrpTMEJpy+Lm4hHKOSnalZcphzBfd62/UkQkB2pRrcbvD
	43QyDbWOnZ+8OauHGKBx4IbG/7cbDMvmNsLTd6d3wKFMHQJ4/8f84ON1JCMHSgl8bFfkJHArFBW
	Ro9fDOhxnN2ZZqXfNoqCI9vmG7nb8P/PJ11DYf53lje/OZuXH5FI/gLWacN+O1sIAJXbH4zGWd3
	ge2ltKMOW63/zxB2tfAipxBDY66xMuVs1cXx/oY5nqpxvAYKcEQp7JF3BLoiVDo1eMGzg4rtYOc
	7p1UCaIopDrLFpXWLAEK7hFuZEltj1JZGQ9p0Jg0cn3vqgtIs1wA==
X-Google-Smtp-Source: AGHT+IFQwOW9ypCmrBfO40V40TmowR671am79mhrJirvNryYqe4KZtBxUVUIrTsSySBnxEi9hnim4w==
X-Received: by 2002:a17:906:fb0c:b0:b73:3a:c49d with SMTP id a640c23a62f3a-b73003ac728mr419113666b.52.1762803378430;
        Mon, 10 Nov 2025 11:36:18 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcea81sm1153026166b.13.2025.11.10.11.36.17
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 11:36:17 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b403bb7843eso620901766b.3
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 11:36:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgTq16kLRF5XAkqfCG4AZ1Mv6yYtw000zmY6Gknw0bsf3shC0WFtFMOfx6CuNvv3SgKt9kqwofASI=@vger.kernel.org
X-Received: by 2002:a17:906:1355:b0:b72:eb03:9322 with SMTP id
 a640c23a62f3a-b72eb0393acmr666007766b.15.1762803376534; Mon, 10 Nov 2025
 11:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com> <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
 <aRIxYkjX7EzalSoI@kernel.org> <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
 <A274AB1C-8B6B-4004-A2BC-D540260A5771@zytor.com>
In-Reply-To: <A274AB1C-8B6B-4004-A2BC-D540260A5771@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 11:36:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=whczwG=+-sAzoWoTY_VOwdFH3b5AkvQbgh+z98=p1iaXA@mail.gmail.com>
X-Gm-Features: AWmQ_bmIQjBbP-mWv2JFFWotDHPz9N5F1IH58uHH12wUDflk5iKlAp9e5SKychk
Message-ID: <CAHk-=whczwG=+-sAzoWoTY_VOwdFH3b5AkvQbgh+z98=p1iaXA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mike Rapoport <rppt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 11:18, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Copyright reasons, mainly.

I really don't see the argument.

The copyright issues are all true for all other code too. In fact, the
copyright issues are a thing whether tools were involved or not.

Copyright is *always* a thing.

We have a fair chunk of actual generated "new" code, whether it is the
millions of lines of register descriptions from hardware companies, or
it's the millions of lines of unicode data.

(Ok, the unicode data is just a few thousand lines, I exaggerate. But
we really do have several million lines AMD GPU headers that must have
been generated from hw descriptors, and there we didn't even ask for
the tool or the source, just for the usual copyright sign-off).

I really don't see what makes AI generated content so special.

Yes, I think you need to specify what the tool was and what the
conditions were for the change, but again - none of that is actually
new in ANY way.

This all feels like the usual AI hype-fest. Because THAT is the thing
that is truly special about AI. The hype, and the billions and
billions of dollars.

I claim that copyright is no different just because it was artificial.

What's the copyright difference between artificial intelligence and
good oldfashioned wetware that isn't documented by "I used this tool
and these sources".

It's just another tool, guys. It's one that makes some people a lot of
money, and yes, it will change society. But it's still just a tool.

                Linus
