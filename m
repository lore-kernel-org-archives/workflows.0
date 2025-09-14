Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094E26CE23
	for <workflows@vger.kernel.org>; Sun, 14 Sep 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853845; cv=none; b=TX65Zs3OWGyNFN1JFEn/Pe/rXXqI9aQF30IqFZx3EtAM2Uj8uEWljGH+N/cpta/Cmsjdst8muR997kdhY5zj1vh3J9ggGrDGbR9bYZ4DCDop/g1kl9W3FyvTM7DHSTsqwlxQkNNAwRMpW8eK8qs0fjBZ0gsH/fY7Mm8VdoKqv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853845; c=relaxed/simple;
	bh=svE6igiXDxsnOYK3D5DUm9vhNsmGIP3w4ePRgbDgNcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOXl1tStHrmFl7HchhZ0vErY37pZmV8IzIcZadjYj+p5gzzi4O4r9MaYRWihCHiS8nbyVy5J4C9q+xApLFl9mbb637tuQZeXet33dCzgWc5tlNIUKKWRyoS+Nnot1p6tiWvSJjAB+S1oJ6Ke3CBY1YS1HS8/lAKtc7QRFPRGW8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzV1iDmD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzV1iDmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA93AC4CEF7;
	Sun, 14 Sep 2025 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757853844;
	bh=svE6igiXDxsnOYK3D5DUm9vhNsmGIP3w4ePRgbDgNcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bzV1iDmDHQ/2cU12m1fEqj1mv0/VqZuYGge+S1dC2/tugl1QCpBfxGT+iT696hxsz
	 EFg35aCwWAexL9dpVT4XJHgifpWL8Ve34pF7RSg7W9k3o/ulAq2Z7QQ4klPcZpuvR8
	 tt3m2c1FESeNrCVPHQpimgC/gpa7/N0clZGy/CmwMkQG00hG2+5R8ubAQrx+OwU75G
	 6k16xBOaoMtCYglm7uaPKIz94DWYUVRSwkcgJUAB9rJWilcsx3prZKb/7FDXu8uVx8
	 ml0FQ4XItzQT2KI1lTdu4ajPAnWuru3Rqjn7srNbxhgSW8LehE5scy66RVyNKC4lMR
	 iZrUB4kgT47pA==
Message-ID: <2910e736-b74c-4b6c-aa8a-85adcc3cc680@kernel.org>
Date: Sun, 14 Sep 2025 14:44:01 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is there an integrated b4 + patchwork guide for maintainers?
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, workflows@vger.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1bcfbc51-18bb-4a5c-8a1e-a2de794ff00f@quicinc.com>
 <972dd368-282a-4255-9b88-6324c1924512@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <972dd368-282a-4255-9b88-6324c1924512@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 01:54, Jeff Johnson wrote:
> On 7/17/2024 12:30 PM, Jeff Johnson wrote:
>> I'm in the process of taking over ath.git maintainer activities from Kalle. He
>> has shared his workflow, but much of it is based upon using Stacked Git (STG)
>> and a patchwork script he authored. I seems like many (most?) maintainers are
>> now using b4, and Kalle fully supports me using it, so I just want to see if
>> there is a guide or sample workflow for using b4 along with patchwork. I'd
>> like to adopt a proven workflow rather than stumbling around on my own.
> 
> I sent this over a year ago (using my former credentials). I did not receive
> any responses at that time, so I just cobbled things together.
> 
> In light of current discussion about using Link: tags, and related discussion
> about how multi-commit series should be treated (applied linearly or merged
> from a dev branch), it seems timely to re-ask the question. Is there a guide


These two examples are not really dependent on the workflow - whether
your upstream rebases your patches or not, will be the same regardless
you use b4 or old `mutt | git am` method.

> or recommended sample workflow for using b4 along with patchwork?


Therefore maybe precise a bit the question, because it can really be
understood in many ways. For example I understood as:
1. Get the list of patches from Patchwork with pwclient and feed to
mutt/neomutt.
2. Go through them.
3. b4 shazam accepted patches, which will mark them as accepted in
Patchwork (see b4 config about Patchwork integration or my talk from
2023 LPC)
4. Respond through rest of them and then delete downloaded mboxes/maildir.

But maybe you ask about linux-next rules (although hardly relevant to
b4...) so that's why I did not respond. It's just too vague.

Best regards,
Krzysztof

