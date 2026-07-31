Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8067535C19B;
	Fri, 31 Jul 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479198; cv=none; b=U+9tlsxgmlstKccMC4HuVOA3U47EFzugX/lEkYXZJCbnxBbCpqEeVRmFsQzDpKZWo966bj1z+EGJoo8VEhY8azMy5m1Lg7gDt2GF4r5hrD5UnuQnOiBu3CIOLAO0uuKtKIC8n2O5+tY1BZwCPXEIhG1hryWzQ73vALPZoX1s72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479198; c=relaxed/simple;
	bh=iEaorrPIWjnnAL/wUOG/Gzx8iV7EJSuMXH1DOX6bBIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9Mhf2GyYEh37TPtUBvhAb2WACuwFkOn0wEOxBu6ApTZnWsMKbMsCiWIRk+QF6Rllku3a7P9TrBGld0kkgwEQHXBAVvxrxBfIBWzV2d5BCfv0mMFrHw+mwdoFtn5ZZ+BTjdYGK4dVLvlw8pyR8sv8JRwlddmyFBEkLOQ7W33Rg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmmirnhZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmmirnhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7011F000E9;
	Fri, 31 Jul 2026 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785479197;
	bh=PQIhXfTbx0yzAGf8bUGcZY8/WsMBrulXwzV+ldhMAU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VmmirnhZSnDBExURvDVGPyKmUnXn0VWYd8qU/r4rgyXcSFqU945faBDku6DfSj8g2
	 d2LRaw3+WjT4Tnu70UG8PaOU6x5d7rHQ5qZD0sITKE92PiIk0U/h6bmEYPbLKGMj6i
	 Sm/q9q3gZkU4MusPYi1uSXA8o8xCG2gLfqDw2hCJsv1Kt6mO3CmPW1Eh4sQCOrM1Fv
	 LREhzmaMgjChKmXf3jFPuHfkl6dZdJhSi8YUNHtDYPkCs9EB2oV/HoasgyCbwA/YGb
	 KGRgMbNnSihKL0KZ4h9fya218Vd6bXqStXmD6sVdwmqv8YwIU1hcFwamYBQIJzW0z6
	 quNtYrgaMl0fw==
Message-ID: <6e7009f3-ed2f-4a84-868b-661b5ac7ab8f@kernel.org>
Date: Fri, 31 Jul 2026 08:26:29 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
To: Cihan Karadag <cihan.cihan@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260728052442.626076-1-cihan.cihan@gmail.com>
 <20260728073143.0e665e36@kernel.org>
 <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2026 10:01, Cihan Karadag wrote:
> On Tue, Jul 28, 2026 at 8:31 AM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
>>> Per selftests documentation [1], every generated test binary must be
>>> added to gitignore to prevent leaving untracked files in the kernel
>>> tree.
>>>
>>> This is an easy mistake to make when adding a new test. In fact, a
>>> search of selftests history turns up dozens of standalone follow-up
>>> patches with titles like "add missing gitignore for <binary>", each
>>> needed only because the original patch adding a new test
>>> didn't also update gitignore.
>>>
>>> Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
>>> whenever a patch adds a new file under tools/testing/selftests/, the
>>> same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
>>> moved, or deleted file.
>>
>> What percentage of changes to selftests from last 2 releases will
>> false-positive trigger this? Would be good to know, checkpatch has
>> a tendency of generating false positives which is quite counter
>> productive.
> 
> It will trigger whenever a new file is added to selftests, which has
> a chance of introducing a test artifact into the tree. I checked the
> last 20 commits touching selftests and only 6 of them were new file
> additions, so this warning would have fired 6 times. Actually, one of
> those 6 had a missing gitignore entry that this check is supposed to
> warn about (fuse_acl_cache_test, 9acb102522b9).
> 
> Comparing to other WARNINGs that checkpatch generates, such as
> FILE_PATH_CHANGES which has existed since 2014, this seems like a
> reasonable and already accepted way for checkpatch to operate.
> 
> For comparison, I checked the last 20 commits that triggered
> FILE_PATH_CHANGES in the tree, and none of them actually needed a
> MAINTAINERS update.

FILE_PATH_CHANGES causes many false-positives, honestly for my work of
getting 100-200 commits per release it was screaming like 20% of time
and never had it right. All of its reports are false positives to me.

And I saw many times people do weird commits and weird MAINTAINERS
updates, just because checkpatch asked them.

So your argument of "reasonable and already accepted way for checkpatch
to operate" is simply wrong. Don't add more poor tests jut because we
have one which is IMO terrible.

> 
>> In netdev CI at least we build the selftests and check
>> if there are any untracked files after.
> 
> That is a good practice. But as evidenced by commits already in the
> tree, this type of coverage does not exist in all places.
> 
> Since this is a mistake that is frequently made, I think it deserves

You did not prove that.

> a warning on its own. In the end I think it is acceptable that this
> warning fires more than necessary, the same way FILE_PATH_CHANGES

No, it is not acceptable.

> does, because the cost of an extra check is low and the mistakes it
> warns about are easy to miss.


Best regards,
Krzysztof
