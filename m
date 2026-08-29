Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF12848BE
	for <workflows@vger.kernel.org>; Sat, 29 Aug 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001321; cv=pass; b=tsusFQ1ATqOe/QLMCWpq8ew0wj8YQlcm66CkLB9mYw8D74BZJp3vkpSF6ESluL9MAmgAsL8p0wGd6BLMzOEVSwgUUF0wWCTxryyV7gjzt7eq2PwxGaX7afJMwEHlB2Jt2maRjbX3GNPOqQ3IpvRcwRYxiMn4q44wje45+r1wb1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001321; c=relaxed/simple;
	bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMX2SPxYanrjGXDsonUOzuakh1j4rCYPMr6FyrMkpDUuJMq2BZ4HscLAJohqsWd4JttKHXbTYcxVQMe9gxcIoY12vhyIqzrsA4bqg6rHdtPQZwWCVDWwDoBJBVlCAmGVDu9eUsUNNYHwKmwhOVbWl94bJdc68B4oXUzrnkJmZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULY/4yEK; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULY/4yEK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d590f4c291so5147325ad.0
        for <workflows@vger.kernel.org>; Sat, 29 Aug 2026 04:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001319; cv=none;
        d=google.com; s=arc-20260327;
        b=UKNZ1YscxUik4ewxBbA2MuFh7cCkr762nY0q94/6zoUNsxDE2d3XPBuwv/B4IUaypD
         s3Lm746tr8AP5g0m5kl0SNsxjQZm6mtgT1rn1BBBlzQJwc9SJxaeBXKN9o0FuS1o2nTH
         MExSGHlZAin9WT/SpaZxjrZfYEbSuOjYqOm9U2nx6VNC5f83jZAgsqIbEvX48arIYBHI
         HUnjpQVwQZR7aNhvnOmIsCLNHedRAmnUaLl7u50KqB7OIQabvrpU02NVjVR6hYSgr9tq
         fRgxS5KXLJj60BvKvcIizr4/eV29ybl8QbkzUHMylfKdr6bWUk4HIVPFJJEv1RABpMMZ
         p3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        fh=L3lnZbtQyeX8CcA8AiREWcWnD+BCHq3ei2eLcFyaiXA=;
        b=SyYxZdoQqOcvtwITGmVDT+QOwY2ls1IHn7e91Lqk+Axf+x5S+VTIkQOnAGbpJ7H1hS
         aGUZ+yGEbjcayiCp6CSnDWX22jWYQFEcSSbYN1k56RjMes1WrqXrxLszec8ocodA52AH
         /luNTzFgqhugNqx3a+3/3ty1rccKeij/NAx1qUKDlYOjhYGJtBeygXSbBliyFP2IwK/F
         m70l4fHXKVchcsuY9ayEp2vuOk6hvFhznNgDvw/J+yQwU6euElyl6kivBGWXYnQ8qMEE
         Wy5Xs6OuXulJ5UTL+YdYrRcqQ+mSZIZBwjavfjf75OiMuJiEOpHECdI5ooOCJg2W+/iH
         2DoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001319; x=1788606119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=ULY/4yEK/OIiEqWn0gINn/0zr+jhfFt2Hmb7UdU5PhDYhCKiZ/XEyFVW0fzWgR83FF
         rgDVvp6gNTgymqikWmL5xLfNdE0/GAmAfWcf0zBKSqfcyg+GbtCPgseRu4mbTV+eeDw7
         w6hM1fMEVUUD1g2NgAyU5A6LX/1rUtFHxVssN8iciKkldDjtCRyqdaZMgu8ZI2nrZBli
         MfjO9Bg6za2Xqlz8j6liqXDJ38WDtIl/NRRwJnPJw9oy+7tu4Ayjl6u9I4M8HdMzhjgq
         Fbu9QZ/RcF+77fA0G120L64raDnchxzfwejLB6GqZTN/4PT3ElQWrlPHzAoHIe1fXhcQ
         j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001319; x=1788606119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=JBjuuNq2DH1NwE/WPlBD7rL7XlnZMkgGdTSVA0ERr22odAD97yVxL+3WMX/LFwG+4f
         U5XgCWepqgP0kaTv8IXLGYCg6XkAOZ7KliU6J5uVjevHKDgt2rZCEtuKWDKnuPBV/VEm
         jrovJGyg5rint0w2xDRum0JT50wruSvmuUwjQtVBLALukCegtjm4CxTPJA24bgrvxX4J
         PVzO4JEA+gzdILrTElGkwc6A3WgahonEMFnxCdfGS+kCxQd6lUZhT2Vx7WVuVnA9SKSd
         ZDL891NZt+rSxlF/rhoUJrMm60FZvtEngJjngy3uQ6Ulns9dFjkAjOM8LKo2XWAp7t40
         PkQw==
X-Forwarded-Encrypted: i=1; AKwUvBwGDkX8/KhDPZ5gvZoj2zQNbbnEsl0my60O7baUSqAhuO/okWG9niUu4cRCTDyniIw94ccXJI0e71I=@vger.kernel.org
X-Gm-Message-State: AFuF++l6/JOUhSofrWYkCzMp/fzFcgEYjWzaEzP+BTR3NddVIcDMeWrh
	gCgsodPKTOObYcscNmKpeToJsyS9DGz4QQYu5jMWmrDGL8wUQsDgz2iv6n341QEQaHZ6gjs2Z4T
	5kG7WGCrX+cOdyFPndtCFQfxyW3Ej+Z4=
X-Gm-Gg: AYBFou2zzT490oxUiYYc3l3Bv7BqBa1+zHV/I+gwG3VUPBEVjDOwMayTuf79tBScmSK
	WkisUvULhb9gWpzXJpZKRAxOUzibrlnNMR842YnWTEbmxoC32x6RPkMOeIulzRgpL/At0P30xHs
	BEbIignibYfPT7HzjCq4z9N1yH3pqS4zYj53VXuWlmXCYxcv+YQxDtdcLefxjTt2VE/en29DN0V
	KhJe/CJd+NZrzMHB0GIwPyvpSxlev0B4RxvNTLfpd9ogjzelOcWZRQZhr9bO97YWvBuh/JJUgpp
	kLi13egMArc8H0AIvBB8ekEJHxmS6hm3utNUgGV2E2wOz5LT/x7D2siE+fCZW1/p2zf3ShVMBkg
	MMFktYLW2qkncCYgdhaNEGJFNIi6NWjjfwajTNpI49B/5c9fsLMFbUbbfW99J
X-Received: by 2002:a17:90b:5546:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-398bacc54eemr1390032a91.4.1788001318956; Sat, 29 Aug 2026
 04:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 13:01:45 +0200
X-Gm-Features: AcwNN1XslLuUNYYS77elbKGG8v398s8YpVlpDc2SDM6GYH7rCRkfYicjHiuXC00
Message-ID: <CANiq72mmxxrm3-a-sN7G=t6CEqHkG3MVvkfRMqe7NyNR+C7C7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.

If they don't work today with e.g. v3.13, then that is something we
would need to fix regardless of the minimum.

Since some distributions offer the latest versions all the time, then
it is likely things generally work (or they are niche enough that
nobody notices).

But, yeah, it would be very nice to have tests on most scripts and
thus be able to run those with every version etc.

Cheers,
Miguel
