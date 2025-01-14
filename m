Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10043234D0E
	for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855018; cv=none; b=JncG48Y/e8iUfMOjqwQuM0fLF1X11qwWQashxDYaZuenWgCEVz/2Hnd5oUdDuqfV/oH+Zykb2fn+YmZ745g6fy5Jwpd5W5Bx6THcPWDVtzaZmXgSsbIUWAyH3drswez1g++P1bTXak1x7Ggh8puqzUexo/orGHdhScGRF6JxNyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855018; c=relaxed/simple;
	bh=LXE4XKNa8L3P9SwTug30J68ExN46IM7a0UR4tXbjKOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUM/yNhRB7zvsvJ0qEeYd+ms500P46a1gWdT0uBbv/KewhqB0TZd2dnHCqpjGCJbgfRQB3R/YVBB1G05iMklddSa1bPXi4cjRMeA6jNf19smMtLn7Dy6dS6DJ3EBbM3ZHwVQfj5uMFnbbE0X9/4rD8V6zgjNyYSjziXgc0iLdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmKoxFQw; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmKoxFQw"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so200851cf.0
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736855016; x=1737459816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LXE4XKNa8L3P9SwTug30J68ExN46IM7a0UR4tXbjKOs=;
        b=LmKoxFQwX4ybBwJjR4oz4qMuWHwGZ93TqBgwd0dtpdhF2Tn9MqihoAnwWZ6XBegxiQ
         kMWn2Ikf2FCED0pc7GiPLDEsqUrfyT30nhRg3FnussoIPvUMsYkI1gU0fcLDKjU2QLNh
         lw/LvJXNWoM0A7HHBs/ti77IpQiGr37dLQ558nG3oc+69nkFYVqEPcd1tb0xbstmW0Kl
         crL/fvQD/GoMGKwCU3nVfBM0AiCby5OEbIMaZ+XCIEXmvVsWWo1pITCBwLhVwqq0EN0G
         Tts2a0du/5N/pDJSeCD3ldXBj0o++N56y5tHF7edIP9eh+qVck04xMQBavB9bJT9RIcj
         qgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855016; x=1737459816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXE4XKNa8L3P9SwTug30J68ExN46IM7a0UR4tXbjKOs=;
        b=peB627J189FOpZhTlfzVraE8sNOEuGBx5LwGmMyXGViOcWVY7kphh999SBN71AlG4/
         Mdt1HdJsFjrvZL+XJtNltAN92PQb9zdFweN8fpB7S3OA4JBcUJKzInlksv57pKwj/4h4
         hsuBjmstBlmI+KiOFsNOQrLAV+WkwWpO51T8UgL6L2KkYlL/t0REVjhGZiSX3h5Lmpcg
         NR8DVMtVekqv5c6ShrSot16oD6e8WThypIiegGYEOMOHvAiON/CdnNS/fruirs6/rCyE
         adE0Mq7OyIitnXjoy+1oBsCaJPBoAcYDdYQ1ZTZQRGkDqBpps6c++xYAdqcbuV8c6OSn
         /nEA==
X-Forwarded-Encrypted: i=1; AJvYcCXYiRnJ3b2h4oHEAmsPAJkby3PixyGO1ANdBzXq4PpzE4CNRvvHZR/jOKN5rGCkZMP6C3NnNlEx0As=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM8Fikg5kUUEQJTOHtrK6qFuMcaOFpNb7V02chZ/NUvAxWLlyF
	imooCKYEInHtLihTPu1MNLWYwUFYpTZ7lvMf4hsca2Z9vxxCwMx3UaNrjiEvZn3F7svITzF01yl
	j064zQ4lruFjsIMVA3+THdiChcRjs5MVrIUDL
X-Gm-Gg: ASbGncv729TGTzbkXFSyGTTfvk9dabWeM9xMxyd8DDOBe/h7A39bpIukkTW/TJEtU7K
	qLa6brgFtySKjGHdPEbvamoySddsHGmzpb154oxCncXkv17aMXZo6qYRbBPOPKifgr7k=
X-Google-Smtp-Source: AGHT+IGJJMlSoD3S43FurdEHk746IWgMVUhVsKFJdCUrPmUWMtLyQRwdIt/JLjgUvhP0zzjiPtJYsSfP0jOTwfZPTIY=
X-Received: by 2002:ac8:5acd:0:b0:466:9660:18a2 with SMTP id
 d75a77b69052e-46de96eac52mr2532261cf.16.1736855015819; Tue, 14 Jan 2025
 03:43:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <a1071d5d3dbfaa0e9e54b359d7b889d84d063804.camel@perches.com>
 <CA+i-1C23hyQJmRQXM2OgCcxRm3ci9b+fK=EkbtFoZj0WpTh7Xg@mail.gmail.com>
In-Reply-To: <CA+i-1C23hyQJmRQXM2OgCcxRm3ci9b+fK=EkbtFoZj0WpTh7Xg@mail.gmail.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 14 Jan 2025 12:43:24 +0100
X-Gm-Features: AbW1kvaJWyrDh22H89zudZwSLg8b3lMw4MVOcda0Xkly1SxU22OYE28Y9Xk5um0
Message-ID: <CA+i-1C1URFUoasjfNUZM-h0=hJOyft3OGtJFRC6i8XdrcOo7cQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	LKML <linux-kernel@vger.kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 12:42, Brendan Jackman <jackmanb@google.com> wrote:
> I think that's a downgrade from the Checkpatch-args approach

(Sorry I mean Checkpatch-ignore of course)
