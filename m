Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7A48DB5E
	for <workflows@vger.kernel.org>; Fri, 16 Oct 2026 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175058; cv=none; b=gMspyynPIIDbrIbWchLeobCqlp2NkskJmIrtj5ityoe0A/9IdswRC56GSoNxkpGi4OwhQvVMoVuLdhpFzHFRLaEoEc+chX60XXF7kzgN5L3qlWFFzmjzw9KmZDNcm20yyUOoFLohN/sCLTx5nW0zIC2qGVv/3tJrNAlkAiG7ppc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175058; c=relaxed/simple;
	bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=JMGrG6IUdkUTOLTaJ5bxWLWPKFG/s+vHtmOVB8pZt/9upju5YZbZGqFN6zvKcu/8+tMf0BjirBKLrsWRnuKABdlONVWrQ5+Qn0Vttj6nTu45CMZXNGxAo/44y2qNxkEiZpYCneNwMKYWb03e8TYuRtpm9Ql/xEJRG6zb1msxV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5l55XuL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5l55XuL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89a595332c7so142828b3a.0
        for <workflows@vger.kernel.org>; Fri, 16 Oct 2026 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175057; x=1792779857; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=b5l55XuLf4CP3BRvUqG+XkMBAHbn4cXQ/jQVbkSRkBEkPv4QIN/8I4DuigTBnZ0cs3
         klUirn4hyw3Jh0auzmAHtsqQoeS1tlU2YD1kVL6CRw9RghaU6lLmWuL/PCIyy4/+NQEx
         0haL5wH3moPytqEENOkCe415nZUpbJ17TR+DV8A8EDbyqEj+gRQMBtfR8ipiruRbb5a5
         KUHtJiXaHT3/evZVSCiAoYQ9UoTaGudRW0MsAHJd/+ixtTOZJgiQUWWTe+OsNhvqgWcZ
         Q4CgjWz8Us7UP39g5MQTE15sioUUDj+rS5d82PMNvQgzF/UEAEG//CwwxOCcVvKkAuYJ
         VKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175057; x=1792779857;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIepsGyPsDjDb0Ip+H9KtkM7Sr8wz3KXlJWJMjG+7aI=;
        b=oz5WHsPupUb45Kp9gPCPGq0q+V8sGR2PiFTisqsRUSvKeHsWZyphjutIyNGNjbgWWs
         7dmoFSpzD2D2CXsWyLlg3k9rkfixw5BYkCHQ/UG+09wDvqPl9BY1gXF8EYDxbZ2tuwb+
         r9nn8D9j8/thYiMrrRaWXF1rLvpusSlkWtThAWZ6VulR2z5vVu2ghJ4aCOTQK5ZeBvm8
         /+h967AZVHXISh0gD+xYtKYDHZU3mjzjLsx5IRgTszs7tj2hEjVwxTrxohJjv0gSc8Mu
         sYteMygJCRxd983r0ZFG/3HCW3r08ALJ8SJpodbAKHCYxjZa+sCO2iFpisc5/WYhcum5
         8v4Q==
X-Gm-Message-State: AFq9FYKnYIl6R9RIB4tR41dh/9GrDrDZAgS31pDQ7L1C1vIhNlh1atuy
	Ec3Zyvt8YLl5eC821XgKRUDsyKZ91y2TYJ5sPmp0OWXCTQnvoeO4HhfO
X-Gm-Gg: AYBFou37jQM0Hi2v79saglVUXMywAux7ZNK6pAVXWdMh3GqVxW3QyJctk0+DqdIQEsW
	OYmS+IaU5P28owCpPK532ShvI4o3cUJz3PAksHr7BmkTmlyEGNdat8CadBTvJY/rRLiX4iEy+8S
	WzLirnZB5JZmP3DgQeLqv7Hju2pingfKmFp7DUPcvoL5HIzLoFvgjdmjQywKIE1tT4GcMVuQ1u/
	dWimuNApqanpuipYaBBjIqF9Er6JEROq1MDO+sIRkI63AAVUC34DHCy5nm2wGWXgKFhQo+kgbQu
	bFijeVjgZczPrctFpJM60epKF+2oVdS8mWmz5phM7zNMN9NqqAkojjrClKbEZz8Xbi7CNtAmLbI
	TOM75IlxHyb7ubAuNuzWjpbjGbVK6QoYI8lhPOL4joAjOlluEkLMpur/4GFhwhtA9DLYZJ0MGy4
	deSwoYmc8sgXjBLsiBDTb8rZDmsLHAgSAZMa+PF6DHsWH1R4AcjidjUTKE+ZFHzKLRgGpUNKJ2B
	/pZ2U8Yakf4wUzftx3Zy+bAx3ljowaPIgsFVrXSWlD0X7VcztIEEUVClzx44x/ZskqxJQ623evJ
	sk0=
X-Received: by 2002:a05:6a00:4106:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8a04ba2601bmr396865b3a.26.1792175056503;
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8cf81sm1506688b3a.16.2026.10.16.11.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:24:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:24:13 +0000
Message-Id: <DM6H19P1797J.2QYZAQAOI9FTN@gmail.com>
Cc: <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mark Brown" <broonie@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Leon Romanovsky" <leon@kernel.org>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>
In-Reply-To: <atJnq_ssIAGK-OSZ@laps>
References: <20261012213452.1863248-1-sashal@kernel.org> <20261012213452.1863248-5-sashal@kernel.org> <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com> <atJnq_ssIAGK-OSZ@laps>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:06 PM Sasha Levin <sashal@kernel.org> wrote:
> What I had in mind was the kind of bug our scripts/coccinelle/ rules look for.

For kfree_mismatch.cocci kind, yes. Each site is its own bug.
But the other example in the guide is "a missing put when leaving a loop".
That's iterators/for_each_child.cocci. It was fixed one driver at a time
for years until for_each_child_of_node_scoped() made the put automatic.

> I agree that fixing the interface is better, but do we want to push all these
> agents there?

To report it, yes. The skill is read-only anyway.
Whether to change the interface is for the human to decide.

> So I think it should be a balance. When the skill finds the same defect
> in several places, it should also ask whether the interface invites the
> mistake, and if so report that the fix belongs there instead of handing
> back a list for N maintainers

Makes sense to me.
