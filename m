Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468473597E;
	Mon,  6 Jan 2025 18:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736187692; cv=none; b=StZ39/x5r9yrtcVIW9+WUERJYZCu8hBrlp6+MuwJrgiXrWloHBt+mnP02IjoTpH10JG6lOBn8iasgOcG8pyetBB/J9/TJrUXefdlQQtpvg4kCMqIifupjlSCVDb+n0CJmfOpqA06zPcoIOR0ToTXjiTaKbFE/vO5kzifhK0BeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736187692; c=relaxed/simple;
	bh=W1LAf4aQY2Bk8NOvofsdYm+c3iwrNn8oa8z+/Sw7wTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLL9gwlZe3JF06C2wuzxmKxXEpxRWqP9NGIy1ovXgS5219kHwGKq8VF748YQqw9mRfvRrVsbsavxCuUABgTXtBnrxl3n/a795BnRMC/ofEIMWhZXbJhrfQDX5eWhxH2T51F+iTIe8mwq4LUJmUE+nlUqGkq29fR4GbtFXvao+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=osNTrFiv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="osNTrFiv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=vs3+tS5UI5HdOMr0O2+LrUsrrFOrmHF6fF621nzoiuY=; t=1736187690;
	x=1736619690; b=osNTrFivRdA6YQhLbqg0o8cfS3f4dqKOygPap9xk/w56FUXkLwFTo2yle8Wok
	DWssoi5XsBXOj7oESX96LW0oIlnKp3DdNKlYqsydWlSUax9SYBJM9ug6Sd08+JXnTwvQ1Bz6fI8tf
	DxYljP3MlQy3RNmn+njue0L53q2Sxvx8MH3A6jYDNlsjZOhQdzfQi/eH48veRJiuv8h6eHjk0guKM
	LJVt22BL/yAX4z975a6uBghVX+l/RoidPbOYdiXys3oI5PE9FZMlLj5uMGgErRE5e1AZCTbve9rAq
	ysqr51sx0WfFT0tNFPlNxYy8bmHFYwZbYO/fUxzfHZoTSDApGA==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1tUrjD-00Evgo-2y;
	Mon, 06 Jan 2025 19:21:28 +0100
Message-ID: <7224dba8-97fd-458f-a262-50ce9b040f3b@leemhuis.info>
Date: Mon, 6 Jan 2025 19:21:25 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] get_maintainer: decouple subsystem status from
 maintainer role
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Kees Cook <kees@kernel.org>
References: <20241213112921.180978-2-vbabka@suse.cz>
 <202412172145.78ED0178@keescook>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <202412172145.78ED0178@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1736187690;9cbc3638;
X-HE-SMSGID: 1tUrjD-00Evgo-2y

Lo! From the "better reply late than never" department:

Thx for picking this up again, much appreciated!

On 18.12.24 06:48, Kees Cook wrote:
> On Fri, Dec 13, 2024 at 12:29:22PM +0100, Vlastimil Babka wrote:
>> The script currently uses the subystem's status (S: field) to change how
>> maintainers are reported. One prominent example is when the status is
>> Supported, the maintainers are reported as "(supporter:SUBSYSTEM)".
>>
>> This is misleading, as the Supported status defined as "Someone is
>> actually paid to look after this." may not in fact apply to everyone
>> listed as a maintainer, but only to some of them.
>>
>> It has also been confusing people to what "supporter" means and has
>> required updates to the documentation [1].
>>
>> Thus stop applying the subsystem status to change "maintainer:" to
>> anything else, as maintainers are maintainers. Instead, if the subsystem
>> status is not the most common one (Maintained), indicate it as part of
>> the subsystem name. So for example, instead of "(supporter:SUBSYSTEM)"
>> report "(maintainer:SUBSYSTEM [supported])".

As Kees mentioned: "funded" might be better. Or is there even a better
word for this? "backed"? "subsidized"?

When I read this for the first time I thought "it would be better to
keep the two aspects closer together, e.g.
"(maintainer[supported]:SUBSYSTEM)". But then I read... (continue below)

>> [1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
> [...]
>> ---
>> I have been confused myself in the past seeing "supporter" and have seen
>> somebody recently wondering what it means as well.
>>
>> I have read the threads from 2022 that in the end resulted in adjusting
>> documentation only [1]. I very much agree with Ted's points about taking
>> the subsystem status and applying it to all maintainers being wrong [2].
>>
>> The attempt to modify get_maintainer output was retracted after Joe
>> objected that the status becomes not reported at all [3]. This RFC
>> attempts to address that by reporting the status (unless it's the most
>> common one) as part of the subsystem.
>>
>> The patch is not perfect, as with this approach, the logical thing would
>> be to do the same also for reviewers and mailing lists. In fact,
>> subsystems with a status of Orphan typically only have some catch-all
>> mailing list and no maintainers, so the "(orphan minder:SUBSYSTEM)"
>> would never be currently reported by checkpatch. It would be thus
>> logical to report the status in the same way for lists (and reviewers).
>>
>> But I didn't attempt a full implementation as I'm not fluent in Perl and
>> would like to see if we can get a consensus first. If we do, I don't
>> insist in this particular "SUBSYSTEM [status]" syntax nor on
>> implementing the full solution myself - I would be happy if somebody
>> else did. My main point is that maintainer is a maintainer and the
>> subsystem status should be indicated for the subsystem, not for the
>> maintainer.
>>
>> [1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
>> [2] https://lore.kernel.org/all/Yzen4X1Na0MKXHs9@mit.edu/
>> [3] https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/
> 
> Do we want to change "Supported" to "Funded" to help clear up the
> meaning? (But yes, I agree, that the subsystem status should be applied
> to the subsystem, not the individual contacts.)

...this and thought: well, the current format of MAINTAINERS applies the
status to all maintainers, even is some of them are funded while others
are not. Changing this would likely require bigger changes. But I'm
unsure if that is really worth it. Guess not, because it's likely a rare
case. So I guess the format you chose is the best for now.

Thx again for doing this, I like it.

Ciao, Thorsten
