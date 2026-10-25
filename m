Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934732;
	b=NZXqtdltIJxVcmmv5vJeCIb3QhnUPVJTCkaXoGPjMdVGyR+W5XDovYvrQ+hmBvzq+pKZ
	 yNoFOqSgzoq6NA5cf11QA2YHAz07jciW+BCERtdNkahqFDTPGUhLTyYeoLb64434CXuDT
	 Df0rEjd/Y0elyHmgHMNlXtdfW5NceAs4WXsY1A1csmsIC+oDqiblKLrj3nkaTpwZ//3Yj
	 pAiHVd3OdQRWg2KzQN+9JEyBrwXmALb9ggyrrb+XpqcQ5gxajDbpB7+f2++3hSGi7v9Tz
	 +6sIz2GgRz39Am2n5+e3DsqPk7D6e0xtU3ojUtLmlxxi/WyVWHzmEkWdh6EOhMJ4Mfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
	b=uy4aZtjFVjnY9Z/9znEkBW5++TZjZTF0kFz1K0ZB2vIF9apSVrTKQNVXWfTcPXHPF+ov
	 9ADPLZaPA8M4kbWzVI5zsWH6Pi4755wzG4Erupdqqd0lIgX/M2paXcvLbZudQLvhwtc55
	 hynV3c3tK27xqg+E2gcYa2sD0bnTMKDHkBFaji1iSsGKlf/J762INEFyz3hcR0uDffdRj
	 pziknfd9Xwr4w7klmqd4aQnHZoBL8pL+7hxGTWjqxPYI++5caqWQcfvvkNJGNwVfotpkL
	 yw1yVOw67xSRtZchgoVaiDwMhQe+HLTysIJG7NWolEKFV75BqMfdA/NQ7HXNhvD2DgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FA606A31E
	for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 13:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b8b456dbeso26753616d6.2
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 06:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934731; cv=none;
        d=google.com; s=arc-20260327;
        b=J8jnIVV5oRaL+R6mHs03A9TYYZwx726natXExHrxQ4jB3Mh6CJtOWxHImxw5KEJift
         16Wu5g7uLORu5iplCYF7+t1spMUmhIgZPw1evON2xqaZ5OMCgZU/P18fZyeZYxFHj/NT
         kuM/0OrQYmYnlDZos/dKRpqNbSq+PedCPCYL3NGzudt8Dlr1+cfxJ4DLm1MaTplMQzfR
         uVLlUJnLlysUgYU8nqKL7vuSz5ulGIssnX+y3BD/MJLEetYCVMDJHL1tap4HFx+iQWd8
         zAZLfK1QaNc7MPBL95DWjWP0MnaZEqyk91/iMXeukKIY4omJw+Z0jhYL4+xpADTxtyYJ
         hf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        fh=QcSrL9UBp9oaTbqNnSPL2AOMg3W+Cv280i6+6lsEBaU=;
        b=syZwhccFn7fdDZKUkz1SKI2u4XXtyDvFg3rrG0zK42MQUQUV1MBsJLjCC+x9trQqWy
         0FvZgu4woYJxwL4i1FCM0HQkLqa5d8t8AqWYqBeSaarMvGLskmgsy6Wx6hlSULfqiYZU
         7SRMXhdItNJq9i5kqlfX2Xgg3Dih9F1PqQh6aQSvo0YHolTQBw3/1c3N9I3pjW6/rLIC
         ABzQMwzFrIRNJwkIvWF6eXhU80zL3tuuB8BQzo1EzblHOZyIYFPFO3ZtYt66pQoKr4W0
         BT7l2grBA3QBDNHtM/bcS5rfN/d3Q7JE9qAsLZEyXSYmDEt44fdjoU/l+5kOfM/H2r5O
         DtkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934731; x=1793539531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=EHrJZaLt7VtHx1yPQ10O8lA7efwKTyBBrss4U2TzyzskcZWD/Cl1vDMWLSemzmGcSy
         05pxNF//4W5lw3GnguMsycI1rXKU+yVLV2WQ0ZOWd48jO4wHr65waWsdjrqxm58RM4NU
         W9RmPpCzZS4d79Y0NBPb/wChJHF3kDBY1B3/Logmoe4mkOlsV5NES9XQ6WuZwFIVGUwy
         BCbTn/cPLibvdW3WevChQIYSS+f4WJN7IUoEX+/ZdPO/S+WbIwfoec+Pyz1hOM58DajV
         lKkztwJvGAo7pd5IXqaLpkxdK+KIuQuZfR7UDO6kZD2ZlpyuGWUAsCw6/siT57GKeir+
         Rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934731; x=1793539531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=TnYpMGni1W56iJ/3UBJaoTgdcge/hBgTd3/5uvw8hmsztAlfRruB7CGaii0kYt79PS
         p2XVn4cwmBbp+tgNlt0hAzkkscY4q5Ja7oFlTamBR4L6xYfVJP41d9pZdWyJjavLBj2U
         MniyWPLY4Il0SI2zQ83qlqv7l9EaA+alniD2sbkzeaLGw2fe0ZEIc4vK7tM918ic1LJ7
         JzqymI5ZLROO65hGRpbeCBlzPcG8lAGV9JoMM3O4WQW1dwrAj9DY6uBs+oXosDiTGMjX
         SzWftWSUIxvcI48aTOPXNuK8Pt8eODo52ezwKxIkfeOrGXA+shzV7uLIS30mKwquJ3F1
         MGSA==
X-Forwarded-Encrypted: i=1; AKwUvBy1HU/bOy8Z8DOCRxadhimNci21oHiiLeLRc3BDV0+ThyU6hbqS8tUk20UzNm/kPOrvmv0g2nDcWSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZSyF+MbpMWqCioIM8RKWQ1v4ugmhGOIe5ssLLwvLa5MHy0En3
	7KeSi6GiwQDirwuia/cX8wmkZP1TgTKMSVOWE5PEEjYdIrneAZ/LDtCwmgak+Intvl5wGJPWcT4
	uuDrrwguNZM+ffztmnvw9GfzhOxIL/jwR6dGzcBA=
X-Gm-Gg: AYBFou0X/DQ6yDHCiSd++OKodNeaTFRIoTpAnSLfmr4PCrqGemM360bElYM+FXlB4O+
	HJBOQBFdKMDY/cWwTNbzH01RoYeeT4+0Ccbj6pqLHtmTCkRhkca6zdC+i4gd1gAj/szCEM5uESA
	TKyBx4kCSbLWrX1X713ZsrcaPmxwsgoP/Phm6rGD8ws8KpwESvF5y9qr4b26q+cW/QAdVuZnqHe
	YADzOdnNw4Ibu4df/zjxCqbqE3FGwuZ1LFITGnMzmrn59fU3xU/ug+fs0iJhZE76LH4fr3CGr0G
	3SJkHB7pOolHoqMb3hp4k9IS0iIW3qGQdZ53CBY4ukqmwwsp9FKdFY9w13wVQiMEZINyFan1cwU
	bxPA6RD0gyRSXgmKXtfDHfDz7b+m09l38ED+rTV479Cyk1GKTUbpXYMRpmoPCrYFIwxdgrebbKQ
	6uD1dVFCeCwy4WCl+knRrhYRRdJFOk7yOQL/t3lDlsEfWyyzgwJVEdeLxvfMObhPNQq2hefH7v
X-Received: by 2002:a05:6214:76e:b0:914:4376:4ef8 with SMTP id
 6a1803df08f44-91c48d17173mr71961046d6.6.1792934730661; Sun, 25 Oct 2026
 06:25:30 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
In-Reply-To: <179250646543.2190262.8632957027583518623@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:25:19 -0300
X-Gm-Features: AclHuK9kZbLYrL_1P7Nb5PvMxv1l7G9aeHa0aDH5ksgUMzl9ooOaFs_24PQ2VeA
Message-ID: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
To: eugenio.zuccarelli@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Eugenio Zuccarelli wrote:
> +- ``--summary``: If set, prints only the summary line for parsed test
> + results, rather than the result of every individual test. Does nothing
> + if ``--raw_output`` is set.
> +
> +- ``--failed``: If set, prints only the tests that failed or crashed, along
> + with the summary line, once all tests have run. Does nothing if
> + ``--raw_output`` is set.

Hi Eugenio,

Thanks for documenting these. I compared both entries with kunit.py and
kunit_parser.py and the descriptions match the code: --summary silences
the per-test output and only prints the summary line, --failed prints
only the failed or crashed tests plus the summary once everything has
been parsed, and both are ignored with --raw_output.

I noticed two things while testing the patch, in case they are useful
to the KUnit maintainers:

1) With the patch applied, "make SPHINXDIRS=dev-tools htmldocs"
reports two new warnings, and that file had none before:

run_wrapper.rst:331: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]
run_wrapper.rst:335: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]

The continuation lines of the new items are indented by one space.
Docutils wants them aligned with the text after "- ", that is two
spaces, like the --json and --junit items just above. I checked
that with two spaces both warnings go away, so this may be a simple
fix for whoever applies the patch.

2) "Assisted-by: LLM" is not a tag that Documentation/process/ describes
in docs-next, and
"https://www.google.com/url?q=http://checkpatch.pl&source=gmail&ust=1793021034312000&sa=E
--strict" reports it ("Unrecognized
email address: 'LLM'"). Documentation/process/generated-content.rst
asks for the use of a tool to be described in the changelog instead,
so maybe the trailer could be dropped, or turned into a sentence in
the commit message.

These are only suggestions; how to proceed is of course up to you and
the maintainers.

Thanks,
Daniel
