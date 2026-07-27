Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC223B6C15;
	Mon, 27 Jul 2026 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176700; cv=none; b=CelcZhsieMs9Egd5Ao/zM6+u0LCwIVtQPoID+vaTjONsJlqobv7pdxIMeK/P0LkVM+uYyrPW7yODIeF6dkhj66kN1GVhQXQv/HEzB5iLCh8Ve0/o/8uY0/dA7nEuLIdZZ2NWJFemLWtTWpj7NcSbavcynY5wOs5a30HD2xIqKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176700; c=relaxed/simple;
	bh=f/rT0JgtbPCubTUxIQnEbYDwx9dV6LxXDNxNrQf6l90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SE2C03eO9ZPVK/wmTKzC9fwi4tI+/Aw6pl16vtLgtZOnKbvpJQ5UcpWj9SvR14j+v/fHuDZbQt9G87BRtjiTkfBH67mtiaRLcyrAWR72e6YZ69ILqPIGgvyw6L5dqKqweiE85guGSKuNWaakRwHO7w4c72V4pDkoH1bYntT6F5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR0xbCsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR0xbCsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8071F000E9;
	Mon, 27 Jul 2026 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785176698;
	bh=DWE6icRF9aMpvirBO28Yf8kKjTRC61zhlwkSjnTCAQs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GR0xbCsawzjVjBmVmMTdO/tOeE8/uMHVs+459jkYBW78w8w1MxfAOU6lNqxhhWAog
	 gPwvov9Pf9EhiSMrAS1NkCzTTjETfFPjf/dXwf4vFVvzhVJlqq0vyhRCpY010PZ6A2
	 wm7esc3tkqiTbHMNQAIvGhV/JmXjCOYvAHpkFAyx9u+yqQ2dcZ8JVGIeZQ0zd+CZgJ
	 5PFQBnGcUvu/20LmD6P3NH/oCrra2PdT6UDjg5aCoAO9Ynr+3qgJwrt0Uxmwp3agef
	 Is8KzY6wLSNhN+hcI6aGVH3T82YnIshbq04WKrcwxWzoLv2P+4hY2k5zq8FP8cWSE3
	 lrWnJ4u2jc0FA==
Message-ID: <86ef62b5-9896-49cd-9beb-4e7435a6324e@kernel.org>
Date: Mon, 27 Jul 2026 20:24:50 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>,
 linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
 <933506f1f210d3498d515d55266951e1914cbc9b.camel@perches.com>
 <ameceGEbXlQNGOEt@058f6326d650>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ameceGEbXlQNGOEt@058f6326d650>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/07/2026 19:59, Bjorn Andersson wrote:
> On Sat, Jul 25, 2026 at 03:47:34PM -0700, Joe Perches wrote:
>> On Fri, 2026-07-24 at 18:56 +0000, Bjorn Andersson wrote:
>>> ```
>>> checkpatch validates the Signed-off-by trailers against the patch's
>>> author, but misses the opportunity to also validate the committer when
>>> run with --git. Maintainers therefor need third-party scripts for the
>>> final Signed-off-by check.
>>
>> I don't actually see that need as an issue for checkpatch.
>>
>> checkpatch is for patches, not things that are already committed.
>>
> 
> Fair, this is only applicable for people managing/receiving/collecting
> patches - be it maintainers or people gathering patches and then resend
> them...
> 
> I didn't dig deeper, but my LLM found 32 cases in the last 90 days where
> linux-next maintainers points out missing committer sobs, so it seems
> like making this check more conveniently accessible would help more than
> me.
> 
>> If something like this is added, it should _only_ be used when
>> --git is on the command line.
> 
> The 3rd hunk (that extracts commiter, sha1 and subject) only runs "if
> $(git)", and hence $committer (from $git_committers{$filename}) will be
> '', as such signoff_match_status($1, $committer) will not be evaluated,
> and the check will be skipped.

The issue Bjorn is trying to solve is real and as he pointed out - every
second day maintainers fail to commit properly (srsly... still!). Some
of us implemented git commit hooks [1][2], but many still don't care
enough, even though installing such commit hook is basically 30 seconds.

Four reports from Mark yesterday:
https://lore.kernel.org/linux-next/?q=signed

Therefore adding verify_signedoff features to checkpatch.pl might be
useful - maybe some maintainer workflows will improve. Or maybe having
it in tree will help them. I don't have any other idea how to encourage
other people to solve it long term - my talk in 2023 did not fix it,
Steven's and Mark's emails fix only commits but not the root cause, me
mentioning the git hook convinces one maintainer per 6 months to adopt it.

Maybe checkpatch would help people to get it right...

[1] slides from https://lpc.events/event/17/contributions/1498/
[2] verify_signedoff which I recently moved to soc-tools repo:
https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git/tree/verify_signedoff.sh


Best regards,
Krzysztof
