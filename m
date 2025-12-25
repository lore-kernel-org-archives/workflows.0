Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9171FC8;
	Thu, 25 Dec 2025 23:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766705741; cv=none; b=MPJSlbVdyfTAx4VasA2ptSkzXjWrZE/6SKBdGNpv7D1v5jyhCxjMgr/9e24OXTm1IZk5Y6Bk5jfnQ2tSBb4jpa3garWwUDGIhmH92UV6vhUiUyJ7x39wtoO0aMAOSPmKcjYZIxF8CjTh4N7IK47Et3ykvb8JW/aaj579kOHvwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766705741; c=relaxed/simple;
	bh=sBe/HbyTOddh/+sWMc9USkiiVrO8f1SIAVHi65lCvtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euadPqdYy7DDz0ARm4L06Ye/EFV95ttzb6L7KAquEAC3a9SX9/PydKAfeS3EsB+ImvFeq3wGTVQ1/GjrlsJaWJP6DxQbWXdkb5fLXAKto9NfDSQgtB9oSOfoUK9ykzfnjeRX7xRoiM3CdvLUMYicIRuzZ90vMWXALslBhFh/q0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKO5X/kI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKO5X/kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F095AC4CEF1;
	Thu, 25 Dec 2025 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766705740;
	bh=sBe/HbyTOddh/+sWMc9USkiiVrO8f1SIAVHi65lCvtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKO5X/kI2h36ldzkbSg9rO+zr+D1u1x7xXR1gdpZOdckd4yWzEegbfQZ0XZL+BKdv
	 rpcky78EoQI3lEn5iMZUFWNG6b4jy5xpUCLcjPGFe1Y75qw3G88BnuZ5rVf1oWjJUz
	 JuYBTP5njftcznKSZvL13wQJ4nFtmVDgdsyZP+L3xJ2WukGFfFEXQNIM8gK21tgM1v
	 5iihI99B4yoR0TaGDeiLjXlId94Zd9TEXt9trqK2os8oqws8nyyxCWhmIk6ei8z/kw
	 5jDz0+lqFDAAhad6n74fGgryuV4crhsWMbfXmvJ7uKm0pOwhImSGGqe62dAm3/+LfF
	 NVB9uUKFNtJ9A==
Message-ID: <68d7ac83-457e-420e-a6c3-3d285f5a409a@kernel.org>
Date: Fri, 26 Dec 2025 00:35:35 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: process: email-client: add Thunderbird "Toggle Line
 Wrap" extension
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Landley <rlandley@parallels.com>,
 Sotir Danailov <sndanailov@gmail.com>,
 =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade <paulmcquad@gmail.com>
References: <20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org>
 <1aba733a-b29a-4931-b1c9-7df35774db38@infradead.org>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <1aba733a-b29a-4931-b1c9-7df35774db38@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/12/2025 at 21:41, Randy Dunlap wrote:
> Hi,
> 
> On 12/25/25 4:32 AM, Vincent Mailhol wrote:

(...)

>> +    https://addons.thunderbird.net/fr/thunderbird/addon/toggle-line-wrap/
> 
> Please use the URL from the git-scm.com web page (i.e., without "fr/").
> 
> https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap

D'oh, I didn't realize that I was pointing to the French page. Thanks
for spotting that!


Yours sincerely,
Vincent Mailhol

