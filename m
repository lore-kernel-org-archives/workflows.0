Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175629;
	b=tghSxZS5CGqc3lTrLc9i1UP+h3fdO0tY/J+9uUu4OHY3VNmFhYm42xyTDrZsZZbwLioB
	 mQl9Ov6VIkKfCWjXsyZyk+Hzzt1ybg2ajhxQJaoJrYYYcq3WjqGfraiM37jIht8QHGoEO
	 3na+hePCf8z+4zGvbkordb8KUyOvc/G38u6rgl3A5+RiQ87gtVyKxtSk+rl0SpbEraYNQ
	 4Sqwlh2EUE233v0RQUQFF4Cbryr6kLPmzydzyOPh6euy7QqHnuKbwfuYXAtoiXmMZ9Vvh
	 8uz6HIciU54Kmbi8eA4Lp2+EBiDI8ansJLsJYNPFVwIvfeSsqFbYoNbT467L0qm6eiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
	b=COfq/hVs1EpV5wR6WD0D3RpEV+/rKLGFrjY0qvlRosZz/3uLtFUxwSEttdST4GdCuJx1
	 AkGQsw3hYQXBAY8lTIHSwJBTsk4SIgzOFqnMl+aAaBQqF1TsjUKQ46AQZ3cISkY0edJDH
	 e/vzY/1HRVhd1cgSpVv50Xmot3LRRedeEOfcmHZ8t+KPR8ucGEv87ru/RJofT+tl7ka+J
	 A4C3ehfegNcT39ddL5VvytzikGSyB9B948T1FvYy4zbd0sZ/rmOtqVkDGT/HfiTd6//Cy
	 flb0fi0rJHiKKwDw8q5ZQAIpiGOUffNbC6B/9U2BouebR70x3fMe+pZsmjdTyoNDBCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD04606A322
	for <workflows@vger.kernel.org>; Sun,  8 Nov 2026 22:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD04606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so2774526d6.3
        for <workflows@vger.kernel.org>; Sun, 08 Nov 2026 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175627; x=1794780427; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=DMkSfkrIvh1J0HmyqnldyergtJCpVvzbM5wCx8OJ2o23lhtd7XoP/mungBoCmsSuqV
         M+rYApkY8E0axtbaa8c13yvk09njje6q4WLdVpJlBRrKUkSiA5bVzZwBO1ycKC4sqJIB
         R+Nkm8BWTmhQ1/h+bNlpkJ0sR92QwIqusM2bsN8SVZr+JR1VvGLQqBKIdo5z1FOoj/OM
         abdkoH7n1mm4fwCKsW85apwhJYw/e2R3cVgrjcPJxPubj9JnXKEZ427TWvB9z3Pc3D6z
         6V7XaK1/XyDyfSxMPSZ5S1XB3652vVtep5CjHsJygTDjnHK8tdBGZOY0VaHvLr8eor7U
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175627; x=1794780427;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=tRc4r/+m8ymNJE/1skBtdynUtay4UMRzB7CBnUt3R6L8tzn8ZnkPckiDIyFP6iGKma
         ToAapMMBJm9FD7QexmvgCV71oGzBmrVOzFe+IJOfReNZqrY/6fpI69mk0Va4syA8egBs
         Ig8WkkbK9PVeZG110tW5ZdpCov0MWUjgAPTtmPK7oihYFZ/kiQzkioEfrbTSQqHIyA4C
         9IKslY9oFUxVRuYhfXLA42R3SNl7WBrW1Y7Bd0dhcKyi6ep48Y6mEzpc4HniaNk8xN5S
         BclQc4pt52ui0pZof1pyHD1IxgEkgtwzn18zSbbgcroezO3RONf7QGycXw7pBf32t2ez
         PcDA==
X-Forwarded-Encrypted: i=1; AL+hErEeaWgUtl7Li+rUayySgpbRooeByaRXAZPys9agEWfum+ZANUgcVdR7GCB4pd1vbbplIvPVZNT2BpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/25pcSqYFwHXVmYjTsgnLh3K1qsfEJPDhg6hDweecziolPJJdN
	ZeUbzeOwEMCyHsEY79fhHJWw0pEnVkzrELBZwjUR5o+phFJ1F46ZZvg=
X-Gm-Gg: AYBFou0hcbv23Hoamh1jTkaXnS80rr4ONWRu+G5Z8AoAPqJA5lcSDTdEo5qI0SYls6u
	rKfMkBDda6YJBkqg3Gwz0XcvCBXCh0Glyfhv9zPbyWXYNU+yIMylQc58JqFKR2QHY5D/gdtClqw
	2z7uF+YRFMhk/tdtqHW1JB4HoPuHVpYPsOGZj07hlvuE9Q8/PPkSOlBq2OC5gYiI/Qi00+ZzHgu
	k2sWh9FZTHclzWwsadXZ4vS58N0FfGztiAZXnx8zyW/E1n/VU07S98dsjnkM316hwfqlNQox/7b
	4gYfYCPPffPq64usCRedMFl1fs0hG1GW/y/lqN0WeYEZokbGtiGNfAGNUtYJ54a9bCYZ6Q5bJgG
	rN1/H9kYCxLCuKXY2cxH3d6sq7Sjz6fjSdUKdKyeD/ePFxtkra87sqy72QNxvmaawdSB6HDmUBo
	91uZvJia/5E9/dYbtvfyYNfZWXCVOSoiEodFihHSUM4zfGgt0Pqbml5PelCy1ZQ94lfAUSRmIq0
	ayqOS08LoazcyHIxTg52+ntIqhpPuAgyXeuolJcA9OVaYd7bXFyYcQc/lSUI+0JFl5QEuynOjJ6
	nrdSMdI2BGC3YqhhKAXS0a2ZvcJ2HcBuamrD0DpidvpuYMOMHWWtSug59UFZqycYHoMw6ASNx3U
	qVjeUIR1tbDjWX9D87h8LO4CJVyLPPYA5ZHCzg4mOb0/n6Zga6a9DAevKxpEo96PKb+PzBnM=
X-Received: by 2002:a05:620a:1a03:b0:93e:3824:4123 with SMTP id af79cd13be357-947848e90admr386631985a.65.1794175627456;
        Sun, 08 Nov 2026 14:07:07 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d93650sm306944185a.23.2026.11.08.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:07:06 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
Date: Sun, 08 Nov 2026 22:07:05 +0000
Message-ID: <179417562518.1641291.6757389780804092916@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David, Brendan,

Gentle ping on this v2, which has Daniel's Reviewed-by. Is it okay to
pick up for the kunit tree, or is there anything you would like changed?

Thanks,
Eugenio
