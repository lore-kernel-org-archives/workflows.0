Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02855E48
	for <workflows@vger.kernel.org>; Tue, 27 Feb 2024 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709076976; cv=none; b=VmHKoxhBXBZ94ssRDAIi4EgcBy0duyN+HqvQGUh0ETkDMhDBxnag5QNTYGYhydCJWcBzYnQAdFRhxTcd2aQ5DbH3DKXkES0NpzPKotwEFVt/lD9Z7qelXf59FhC8HIszC0K3/xJ75QPGDPYbjtVwbv1yEIxJ7fwJYUafnVWJMUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709076976; c=relaxed/simple;
	bh=jxG6LpvJFPMwKvthVAFYMswdtFgvTmCuOhxQBi1sjoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD2is5xBFyZSN7zrTSxd+CEr0Zv9LQ6S76u7B73qtVpuIvMjgtXxq1a6hZvwB4zAK6InfW8zWA32klCInEOi7yVDim09W+w9MPk1eicGnMoo9cVIT9eTxKC8y+bLCyrB+QB9tDabRYJw/ioQjavxGDPjL9xrjY5Ho2eAGPWd8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-214def5da12so2616207fac.2
        for <workflows@vger.kernel.org>; Tue, 27 Feb 2024 15:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709076974; x=1709681774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdI2X8i39h7lNyezT3MNte/xo0yw1K+6IRHFFnRsFAM=;
        b=SPtkyzhZduaqh0kwkNF98LSb/om49IXmIbkCpOfSzcWGvy906s7BSvsTgtobfcf8S2
         25/Jf0FXZtAhfLk3nPeVziMbFR4TVbOkHH41KaIix8IoMxBzXGD5ZzQF01TZuvpzEUVn
         tM8snzTz03v21FPzsUtD8gbMcaze31qnS/yH7js4QTlSfuaPbNAumDcBWe7JNPLrivHa
         ZGeypv4Z12+6SEDiaXBz4FQVnygNz9gIy+vzHIt6K+L5ccJBSnLHWbYAVi3W3VIgG6H3
         ZPIbEPlSBkDV/KnLTdYdpUt0SKkiGoYQmkw7XzJfYakjazcPmXE33byRYJm9QqkkNzgY
         NJpw==
X-Forwarded-Encrypted: i=1; AJvYcCU/0CGNgo2BQQd4FlZI5Y6fRT9Z7l9ql9/79LnT8XfBl5WbKtjk1XBXmbjyCmhgYxNMztHmjwRAv6MqpSBA5dy8x9a4t7YmUazy
X-Gm-Message-State: AOJu0YxQ9fbfH7m+Wv7U58/toixeGNsrkuRT6odysgo3u+Zybtzmdw4a
	jCPOxukX/bCSFYBBNqaa6Z7EWPap4Gey5RiNe7m4k+tTNq9WaEGTL+YBU62aj/x+mUt47SdX4qJ
	RRzTzmeuCFXLctqZMtpbFiwwW0w8=
X-Google-Smtp-Source: AGHT+IGGwElNmh27FqvwDGj9r5hA5yZwhzuu4R0bYdvNk7mMgtBQMdmthqifTbSV2eD8aL3D0LZ7POKzTvcRFsJNmhk=
X-Received: by 2002:a05:6871:a4c7:b0:21a:5866:f619 with SMTP id
 wb7-20020a056871a4c700b0021a5866f619mr13577837oab.27.1709076974454; Tue, 27
 Feb 2024 15:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
From: Junio C Hamano <gitster@pobox.com>
Date: Tue, 27 Feb 2024 15:35:56 -0800
Message-ID: <CAPc5daVFWQ0eUrZb+JHiUUAnmME6fwBpc9-qjtRwtCm20dp2JQ@mail.gmail.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4 integration)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As somebody who (1) did not read the actual thread and only read the
text in the demo, (2) would probably not understand the details being
discussed if he read the actual thread anyway, hence (3) would not
know if ChatGPT in the demo were merely hallucinating, it was a very
nice demonstration. Of course, you are interested in knowing if people
find it "useful", which I unfortunately cannot offer much useful
input.

On Tue, Feb 27, 2024 at 2:32=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I was playing with shell-gpt and wrote a quickie integration that would a=
llow
> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
> asking it to provide some basic analysis of the thread contents. Here's a
> recorded demo session:
>
> https://asciinema.org/a/643435
>
> A few notes:
>
> 1. This is obviously not a replacement for actually reading email, but ca=
n
>    potentially be a useful asset for a busy maintainer who just wants a q=
uick
>    summary of a lengthy thread before they look at it in detail.
> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>    ChatGPT to generate enough tokens to cost you $1 or more in API usage =
fees.
>    I know it's nothing compared to how expensive some of y'all's time is,=
 and
>    you can probably easily get that expensed by your employers, but for m=
any
>    others it's a pretty expensive toy. I managed to make it a bit cheaper=
 by
>    doing some surgery on the threads before feeding them to chatgpt (like
>    removing most of the message headers and throwing out some of the quot=
ed
>    content), but there's a limit to how much we can throw out before the
>    analysis becomes dramatically less useful.
> 3. This only works with ChatGPT-4, as most threads are too long for
>    ChatGPT-3.5 to even process.
>
> So, the question is -- is this useful at all? Am I wasting time poking in=
 this
> direction, or is this something that would be of benefit to any of you? I=
f the
> latter, I will document how to set this up and commit the thread minimiza=
tion
> code I hacked together to make it cheaper.
>
> Best regards,
> -K
>
