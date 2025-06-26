Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8B293C7B
	for <workflows@vger.kernel.org>; Thu, 26 Jun 2025 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927068; cv=none; b=VibdNV3x8+0P/8xFqLWyxTBWR3Iin5BsbTlGLmznSGQrdO8g1OcZQXB34YvO6PKjlPTvSdcQOIiHsa4lrMEOoC6CvnaahgQwkYsAQ/CPS0r42sfT7l+y42XfT3+CmA+j0aQ9SgDvTyaXBAY+/PdRFsVpET7xPRWfpk1GfeVEWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927068; c=relaxed/simple;
	bh=61NR3+cv2s+s8non1oheMAZjlDoX1CX3MknyPY6bDPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ply6+H/T4avedmmaWPM1S7h9iPnRmQDpzzdoOrSyHtyvUwdOs3/kV84BNyv/WXmts9RiOH7N3tbIgdTDJUwo26KIjxFhxT+uGCHhvfAa+W2HKp+k8TB3umzwuLb0HnjvyHbj1DBNkM/+9AAwKXMjkdP83K6nnPEUJ7OXm9ykcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MKIuUEzV; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MKIuUEzV"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so8061411fa.1
        for <workflows@vger.kernel.org>; Thu, 26 Jun 2025 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750927065; x=1751531865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=MKIuUEzVQIcmMdKU3umjnTlK7MaISvXiPxmI9b8x7G4ODEkVKgQay1l9COTq/9+bNO
         FB1XgAscObG5wp+hdLIMG2TWL2oiKbF7w59KJwHq5xxvLLKZz0jn/ftrtA+eIpVr0sRg
         GGX6Lvv5AEQV7FbpMQrMe6pi1CMcfnQicEl8EEvaubcg2hdSnlA1fZmE0tx/zXwv+Rgw
         4CWZfgq4gTEq/yYsjpF4wxn+047j+px8s0A3E207294ZYQMw8kQILB+qulyEKLHIbqir
         nCvloDgir3Hkt/VzosMMSbU5qOBtU7Z7kElhKTL5HDRJzTJFCWfR6nhgu7OFwMrh1E/T
         GZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927065; x=1751531865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=BSdhTEBtHfIJPoz62aU66RMViZcHVqOJAVvi+iB6O22GdSBCaCPc8rV9VXAtDP3aI2
         JKbf3geV4otQ47qb3I1iyZsQhr0p+lc/E8iYKr1+Gy6JB7h9y0E504CGKQWhFV5jcwda
         jD3mliV1voxsLog1JYV0LmVJOqdcLe7sPlzwipmHMn3fna50DW0AOTRr8rm7xueJdHZT
         kYu6FE5Pf+vjeWnB0PsGDXVj/df2PAYVERl33hQsFUe0ShSHdQjzWFmzko/PLUGK/1kO
         vdV6dQODj3sl1VkXVAp+WzNUAH+ju4EPyqoVtZbHSvQMycaCnYfCksvi+eTkg0D/qDqW
         DgLA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqQLBiPV2UYtuOipHN+Q5ZUUMpQBzse4BBeT/sC4v/adpeQ05xg3hgz4lVNeIKvr3ax4HsSeD6ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aWzdZrCSvldsPv7+W95al2Yn5UGWnQhY9EETVYgx5zGgr6nE
	XAjOPR/o8ILBaHNLHIMu0XV3UisLd/fDZ+L8Gr9ezP1CHcZUXdjyU1giND7Mk6EADgjW/oek47Y
	vp6jDre+GO+r1YInCBRHEdQ1z5RiXvoViL94qryKf
X-Gm-Gg: ASbGncsiGpkttC1q2sevewGKNZKC9ahLN2Z6IBK8n3zC5xWn/bbnopuhjeSD+Vmh45C
	L78wZMRhLjYveKNg6OJzlPKKJXbWt10XQXSe4E4R0dBTMq6Fuy0WIdNdlBgxC69mGeMtPTCV/qI
	GnjFqU6uE0dj0htYFEL8xdmFk/1ZNArdfPKPpQ3qoaD7nqJNVLHaTDoPX+T3T5mejGwTPI4rBF7
	S21StqU+ZJZjiw=
X-Google-Smtp-Source: AGHT+IFoce4glEmRfpaGq1cEJXdDdpQIuRzef09xN/mVCcmD+KVlQpUFkduHrAryLe+sJhQ5P60PGjtSCXUKZH3ivEQ=
X-Received: by 2002:a05:651c:4088:b0:32b:871e:9862 with SMTP id
 38308e7fff4ca-32cd0261797mr6223281fa.20.1750927064914; Thu, 26 Jun 2025
 01:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy> <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
In-Reply-To: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:37:33 +0200
X-Gm-Features: Ac12FXzg-OSj1zle3ASePCxnUdh4OCWuOBwquUmVr7PDJNx1ZtzdOjfrL6XnuBI
Message-ID: <CACT4Y+b1Sou9bzhsuJ_LAjwCtynWN1iNRnaUkkTecNWxLUfMUw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 10:32, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> > >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> > >
> > >> >6. What's the goal of validation of the input arguments?
> > >> >Kernel code must do this validation anyway, right.
> > >> >Any non-trivial validation is hard, e.g. even for open the validation function
> > >> >for file name would need to have access to flags and check file precense for
> > >> >some flags combinations. That may add significant amount of non-trivial code
> > >> >that duplicates main syscall logic, and that logic may also have bugs and
> > >> >memory leaks.
> > >>
> > >> Mostly to catch divergence from the spec: think of a scenario where
> > >> someone added a new param/flag/etc but forgot to update the spec - this
> > >> will help catch it.
> > >
> > >How exactly is this supposed to work?
> > >Even if we run with a unit test suite, a test suite may include some
> > >incorrect inputs to check for error conditions. The framework will
> > >report violations on these incorrect inputs. These are not bugs in the
> > >API specifications, nor in the test suite (read false positives).
> >
> > Right now it would be something along the lines of the test checking for
> > an expected failure message in dmesg, something along the lines of:
> >
> >         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
> >
> > I'm not opposed to coming up with a better story...

If the goal of validation is just indirectly validating correctness of
the specification itself, then I would look for other ways of
validating correctness of the spec.
Either removing duplication between specification and actual code
(i.e. generating it from SYSCALL_DEFINE, or the other way around) ,
then spec is correct by construction. Or, cross-validating it with
info automatically extracted from the source (using
clang/dwarf/pahole).
This would be more scalable (O(1) work, rather than thousands more
manually written tests).

> Oh, you mean special tests for this framework (rather than existing tests).
> I don't think this is going to work in practice. Besides writing all
> these specifications, we will also need to write dozens of tests per
> each specification (e.g. for each fd arg one needs at least 3 tests:
> -1, valid fd, inclid fd; an enum may need 5 various inputs of
> something; let alone netlink specifications).
