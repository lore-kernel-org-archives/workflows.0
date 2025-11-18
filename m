Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A072FE079;
	Tue, 18 Nov 2025 02:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763432660; cv=none; b=F3Maj/jCAYUCbszREKubkt7d6lV0dBr9zAPTfHsBsCUL048CBmo0HAWpPAKeWsz6TYdn6tI3tB+oXwYPMGdRT5tOiBHzVLIivsZIUtUR2wthVNy4xM6FVGd9sfnD4NGCqExtnNss2j1biiH2jzx+CdnkmqmFY/Ww3lHvgabORbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763432660; c=relaxed/simple;
	bh=Q04kMA1mQKOrQCVK3H3AzvppspBclIoeAKzYrMs5KJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QANiTlL7nLnPGyIGbgv3ePD+zIvwvskSgR660lpIs4SEvrEvvCQU4hCA0POb/3fYSDUBTIPh6KFSWVFASJ+buKNL8YU6Oho+GDkDmnXVgYo8VDN5yMWQ4nY14iDOn7guTxN2Z4CI36KtqN3533U9gSOlgp1ovsjFtn5BWVbJlkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckP+p0KV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckP+p0KV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5572C2BC9E;
	Tue, 18 Nov 2025 02:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763432660;
	bh=Q04kMA1mQKOrQCVK3H3AzvppspBclIoeAKzYrMs5KJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckP+p0KVSPHVvcREBGoQQl1RChaNBMz4vWakcoW7BeIi7sGU/GtCbwBhYY7m/1ERm
	 k2ZxXeYqFnw5b3DeD8EGpCDtZWKPMzhs/NK7Rv7CJkEj7S8+nylxZl4dR1gR6KylJk
	 DfnT9vKV4Y+RpVDauhINv+iBuUvPzgXvsD3w6QDd8V48eAiXh/flO/swVvn6PONUW0
	 Piodmld9M+i1rqSOSBZQn8NpUww7f0DMZ/PiBh4i23sas+Vlpujp22q25NBosSYajx
	 ekIN2gY69TstyCDYt7t7+j64OX7dk8XE5x+lC60nfkjJGp7P8thi7sZ68108OGoU5N
	 zz+BvKaxe/I5A==
Date: Mon, 17 Nov 2025 21:24:17 -0500
From: Sasha Levin <sashal@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, josh@joshtriplett.org,
	kees@kernel.org, konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org
Subject: Re: [PATCH v3] README: restructure with role-based documentation and
 guidelines
Message-ID: <aRvY0QbRzkh94zql@laps>
References: <20251117213801.4077535-1-sashal@kernel.org>
 <aRvHpfke8hZ--AHF@archie.me>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aRvHpfke8hZ--AHF@archie.me>

On Tue, Nov 18, 2025 at 08:11:01AM +0700, Bagas Sanjaya wrote:
>On Mon, Nov 17, 2025 at 04:38:01PM -0500, Sasha Levin wrote:
>> +* Build the kernel: make defconfig && make -j$(nproc)
>
>See Documentation/admin-guide/quickly-build-trimmed-linux.rst.

ooh nice, I wasn't aware of this one.

>> +* Attribution: Agents MUST add Assisted-by tag:
>> +  Format: Assisted-by: $AGENT_NAME:$MODEL_VERSION [$TOOL1] [$TOOL2] ...
>> +
>> +Examples of Proper Attribution:
>> +
>> +Good examples:
>> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
>> +  Assisted-by: AI-Assistant:v2.5.0
>> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
>> +  Assisted-by: ML-Agent:version-2024-11
>
>So mentioning LLM version is strictly required?

Ideally yes, it'll help us keep track of which tooling is being used, and help
us improve our workflows based on the results we're seeing from different LLMs.

Also keep in mind that these instructions will be used by the LLMs, so it
shouldn't add burden on authors.

A simple prompt of "Update the kernel version in the Makefile to 10.0 and
commit the result" with the updated README gave me the following commit:

	commit b3fcd7c2ec1818e3f70c4ee9c4a6f5b210e567dc (HEAD)
	Author: Sasha Levin <sashal@kernel.org>
	Date:   Mon Nov 17 21:21:14 2025 -0500

	    Makefile: Update kernel version to 10.0

	    Update VERSION to 10 and PATCHLEVEL to 0, and clear EXTRAVERSION
	    to set the kernel version to 10.0.
     
	    Assisted-by: Claude:sonnet-4-5-20250929

-- 
Thanks,
Sasha
