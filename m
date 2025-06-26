Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105728FFD0
	for <workflows@vger.kernel.org>; Thu, 26 Jun 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926780; cv=none; b=BLbAb8RKR5N0qmkoACFecNZ6gVFhL8o+RmWOhjivUkIHGjAynigepS/byY8kUvdXxSW1PUgBk9QqwEi1sz1i4TAqC8jId05YC80zXGgsXTEWzllVARzeUqRhbf9tjKOtiVfwzbO7shn556Ku1k9q14UayRYj11gZEdUN6lDk5TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926780; c=relaxed/simple;
	bh=/EXnmyDqhgwhNubqEJ+Z7XqtbTMhvh+9M0BZvcE+S0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eS6AkOidRr21fE4389Uxgcwm/ci7QPliqBqajeyrhHJRAwNcbH8JEMU3N1FkpP+VxHmD9lJQVSx+NVUuE1hbw1IXSITkwmQHDjahhWf1wE9jTo31T5H7K7fz8OQhW/M/iKXL194hN6ub+aou0ayxyxf5De1nhulgbQAo7ELE9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJLM/NFG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJLM/NFG"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32addf54a01so7286261fa.3
        for <workflows@vger.kernel.org>; Thu, 26 Jun 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750926776; x=1751531576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=FJLM/NFGEiPONX4FrdSZ0hI/cQk82eO+Lo5YVkchHl8WweUn2tSD6hRktRnJ8QG3vo
         vTJolU3CiS6Cy/pbdjy14FvlPP2Kli+M+DptWSEI/w0U4sem0vUwh1eUvq5kGAYIYvzX
         O8JseJRSOyvj4mqXPvxoSv31hO8QB7HK0gWaImazyNXVnceVZd4E1fYedMkLj1srp10I
         0pej8WZrfLXOJ2fMKlViXyXGNXbe8Lf9ViRgjzppBCSI14J/f+hJxdgsrInoUvTnYufR
         kFVgkbqHWPIgD7tBdjSK0WMLLhnE7YBhuGjSKfnqUnRCf/DC/GT/tGNf9yo/pdRwoy3h
         vqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750926776; x=1751531576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZyqW6LTgx3qQCdMf7DVmwLH6L5ZjexEcMKkRJNzkQg=;
        b=qdagxpLlst536+wFHpdPXX+l8K0w4h3E4W418zJW6u1iRuOmXaGcFnctWKSrU0J5Jo
         u6sdLh4UwkG/oKgqeRpM4A4ppOJxJPLhQboRMqiGSeBC6jEfHPvGEwV25p9omRQ/WPv7
         uDe7BS5HmJH7F/Igo+IKaAwawRT0xK1TGlVzATRwnUasTQY/aydx9Hr6H7eC3M94lb3j
         itqcMbPtVqFWPKEV8IqJOFeqUJc3PJwv9LuXyQlB6jr/vBmKYvDjpLY71C//kh9BSnAY
         a9MSx3aQWX+avKvZwjA0R3GrfS4uo1V3NAuZHLmPKOK2BK0umU2gq2xq+I8Sbe4A1BfC
         mk1w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Scp858k/l7S2kRrrfueEqP0MFrvMUE9+OYFv+CFOMj50rejfEmKP2exi8Fe5hW0JVYfx4whiFLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWy4sNDmA2EmRiH8RGuKzl3izPhXokkbTY0NUXz4+YYNhFX+b
	DhwFHsSi3t0XBgqRDqM4h3ammE2tckX8Hek4nB8RoGcmzcoBeMZqAAFKgUqlnWq0wDRXY3ZDI5m
	aXtxJLM388zizdBnx9jmzS9q7J8RvPAQ09jsyxgch
X-Gm-Gg: ASbGnctNA11z4bbOLEYIqT8oXSjoEhi5TApzQzJ+mreUQ7eT5thacDNrVcr4fMU11Ig
	2f+0sJ9KViBj7y9qwQnpztctZJ+Fc+8izA9KVSR9/QweeZuzw50GrO5jQEknOW2rouuM+ZfGANC
	NeVRsXXF6A6driOuUJQaZ4+Lnvn9Yw9dSZY6ppE9pAiGgSgh9L2e1Zfx4wtAabnOc5qhflWsnv0
	vFy
X-Google-Smtp-Source: AGHT+IETo+L/oV+R/tmnVYW2Qg4rA4aBv5GWRJ/qPp97+u4UznXO8eCK5nvO+CRrEHedFW1CDFl6j9Mm6w/bd2AvpQI=
X-Received: by 2002:a2e:9059:0:b0:32b:5eb3:280 with SMTP id
 38308e7fff4ca-32ccfa91d8emr7830071fa.29.1750926776245; Thu, 26 Jun 2025
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy>
In-Reply-To: <aFwb_3EE2VMEV_tf@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:32:45 +0200
X-Gm-Features: Ac12FXwPRCYLCXOzZA2k06HmxFcMR3fWIsqQHlWuGEU7Sh27__v25jmGtwOdH6Q
Message-ID: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >
> >> >6. What's the goal of validation of the input arguments?
> >> >Kernel code must do this validation anyway, right.
> >> >Any non-trivial validation is hard, e.g. even for open the validation function
> >> >for file name would need to have access to flags and check file precense for
> >> >some flags combinations. That may add significant amount of non-trivial code
> >> >that duplicates main syscall logic, and that logic may also have bugs and
> >> >memory leaks.
> >>
> >> Mostly to catch divergence from the spec: think of a scenario where
> >> someone added a new param/flag/etc but forgot to update the spec - this
> >> will help catch it.
> >
> >How exactly is this supposed to work?
> >Even if we run with a unit test suite, a test suite may include some
> >incorrect inputs to check for error conditions. The framework will
> >report violations on these incorrect inputs. These are not bugs in the
> >API specifications, nor in the test suite (read false positives).
>
> Right now it would be something along the lines of the test checking for
> an expected failure message in dmesg, something along the lines of:
>
>         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
>
> I'm not opposed to coming up with a better story...

Oh, you mean special tests for this framework (rather than existing tests).
I don't think this is going to work in practice. Besides writing all
these specifications, we will also need to write dozens of tests per
each specification (e.g. for each fd arg one needs at least 3 tests:
-1, valid fd, inclid fd; an enum may need 5 various inputs of
something; let alone netlink specifications).
